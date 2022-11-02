///////////////////////// select box 설정 (지역, 매매기간) /////////////////////////
let date = new Date();

window.onload = function () {
  // 브라우저가 열리면 시도정보 얻기.
  sendRequest("sido", "*00000000");
};


// https://juso.dev/docs/reg-code-api/
// let url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
// let regcode = "*00000000";
// 전국 특별/광역시, 도
// https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000

// 시도가 바뀌면 구군정보 얻기.
document.querySelector("#sido").addEventListener("change", function () {
  if (this[this.selectedIndex].value) {
    let regcode = this[this.selectedIndex].value.substr(0, 2) + "*00000";
    sendRequest("gugun", regcode);
  } else {
    initOption("gugun");
    initOption("dong");
  }
});

// 구군이 바뀌면 동정보 얻기.
document.querySelector("#gugun").addEventListener("change", function () {
  if (this[this.selectedIndex].value) {
    let regcode = this[this.selectedIndex].value.substr(0, 5) + "*";
    sendRequest("dong", regcode);
  } else {
    initOption("dong");
  }
});

function sendRequest(selid, regcode) {
  const url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
  let params = "regcode_pattern=" + regcode + "&is_ignore_zero=true";
  fetch(`${url}?${params}`)
    .then((response) => response.json())
    .then((data) => addOption(selid, data));
}

function addOption(selid, data) {
  let opt = ``;
  initOption(selid);
  switch (selid) {
    case "sido":
      opt += `<option value="">시도선택</option>`;
      data.regcodes.forEach(function (regcode) {
        opt += `
        <option value="${regcode.code}">${regcode.name}</option>
        `;
      });
      break;
    case "gugun":
      opt += `<option value="">구군선택</option>`;
      for (let i = 0; i < data.regcodes.length; i++) {
        if (i != data.regcodes.length - 1) {
          if (
            data.regcodes[i].name.split(" ")[1] == data.regcodes[i + 1].name.split(" ")[1] &&
            data.regcodes[i].name.split(" ").length != data.regcodes[i + 1].name.split(" ").length
          ) {
            data.regcodes.splice(i, 1);
            i--;
          }
        }
      }
      let name = "";
      data.regcodes.forEach(function (regcode) {
        if (regcode.name.split(" ").length == 2) name = regcode.name.split(" ")[1];
        else name = regcode.name.split(" ")[1] + " " + regcode.name.split(" ")[2];
        opt += `
        <option value="${regcode.code}">${name}</option>
        `;
      });
      break;
    case "dong":
      opt += `<option value="">동선택</option>`;
      let idx = 2;
      data.regcodes.forEach(function (regcode) {
        if (regcode.name.split(" ").length != 3) idx = 3;
        opt += `
        <option value="${regcode.code}">${regcode.name.split(" ")[idx]}</option>
        `;
      });
  }
  document.querySelector(`#${selid}`).innerHTML = opt;
}

function initOption(selid) {
  let options = document.querySelector(`#${selid}`);
  options.length = 0;
  let len = options.length;
  for (let i = len - 1; i >= 0; i--) {
    options.remove(i);
  }
}

function makeList(data) {
  document.querySelector("table").setAttribute("style", "display: ;");
  let tbody = document.querySelector("#aptlist");
  let parser = new DOMParser();
  const xml = parser.parseFromString(data, "application/xml");
  // console.log(xml);
  initTable();
  let apts = xml.querySelectorAll("item");
  apts.forEach((apt) => {
    let tr = document.createElement("tr");

    let nameTd = document.createElement("td");
    nameTd.appendChild(document.createTextNode(apt.querySelector("아파트").textContent));
    tr.appendChild(nameTd);

    let floorTd = document.createElement("td");
    floorTd.appendChild(document.createTextNode(apt.querySelector("층").textContent));
    tr.appendChild(floorTd);

    let areaTd = document.createElement("td");
    areaTd.appendChild(document.createTextNode(apt.querySelector("전용면적").textContent));
    tr.appendChild(areaTd);

    let dongTd = document.createElement("td");
    dongTd.appendChild(document.createTextNode(apt.querySelector("법정동").textContent));
    tr.appendChild(dongTd);

    let priceTd = document.createElement("td");
    priceTd.appendChild(
      document.createTextNode(apt.querySelector("거래금액").textContent + "만원")
    );
    priceTd.classList.add("text-end");
    tr.appendChild(priceTd);

    tbody.appendChild(tr);
    return tbody;
  });
}

function initTable() {
  let tbody = document.querySelector("#aptlist");
  let len = tbody.rows.length;
  for (let i = len - 1; i >= 0; i--) {
    tbody.deleteRow(i);
  }
}
//
// function regist() {
//   let id = document.getElementById("id").value;
//   let password = document.getElementById("password").value;
//   let name = document.getElementById("name").value;
//   let email = document.getElementById("email").value;
//   let age = document.getElementById("age").value;
//
//   if (!id || !password || !name || !email || !age) {
//     alert("빈칸이 없도록 입력해주세요.");
//     return;
//   } else {
//     const user = {
//       id: id,
//       password: password,
//       name: name,
//       email: email,
//       age: age,
//     };
//
//     localStorage.setItem("user", JSON.stringify(user));
//     alert("사용자 등록 성공!");
//     window.location.replace("login.html");
//   }
// }

// function login() {
//   console.log("hi");
//   let id = document.getElementById("id").value;
//   let password = document.getElementById("password").value;
//
//   const user = JSON.parse(localStorage.getItem("user"));
//
//   if (user.id && user.password && user.id === id && user.password === password) {
//     alert("로그인 성공 !");
//     window.location.replace("index.html");
//   } else {
//     alert("로그인 실패 !");
//   }
// }
