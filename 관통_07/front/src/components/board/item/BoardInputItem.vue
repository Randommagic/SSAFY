<template>
    <b-row class="mb-1">
        <b-col style="text-align: left">
            <b-form @submit="onSubmit" @reset="onReset">
                <b-form-group id="userid-group" label="작성자:" label-for="userid" description="작성자를 입력하세요.">
                    <b-form-input id="writer" :disabled="isUserid" v-model="article.writer" type="text" required
                        placeholder="작성자 입력..."></b-form-input>
                </b-form-group>

                <b-form-group id="subject-group" label="제목:" label-for="subject" description="제목을 입력하세요.">
                    <b-form-input id="title" v-model="article.title" type="text" required placeholder="제목 입력...">
                    </b-form-input>
                </b-form-group>

                <b-form-group id="content-group" label="내용:" label-for="content">
                    <b-form-textarea id="content" v-model="article.content" placeholder="내용 입력..." rows="10"
                        max-rows="15">
                    </b-form-textarea>
                </b-form-group>

                <b-button type="submit" variant="primary" class="m-1" v-if="this.type === 'register'">글작성</b-button>
                <b-button type="submit" variant="primary" class="m-1" v-else>글수정</b-button>
                <b-button type="reset" variant="danger" class="m-1">초기화</b-button>
            </b-form>
        </b-col>
    </b-row>
</template>
  
<script>
import http from "@/util/http-common";

export default {
    name: "BoardInputItem",
    data() {
        return {
            article: {
                no: 0,
                writer: "",
                title: "",
                content: "",
            },
            isUserid: false,
        };
    },
    props: {
        type: { type: String },
    },
    created() {
        if (this.type === "modify") {
            http.get(`/board/${this.$route.params.no}`).then(({ data }) => {
                this.article = data;
            });
            this.isUserid = true;
        }
    },
    methods: {
        onSubmit(event) {
            event.preventDefault();

            let err = true;
            let msg = "";
            !this.article.writer && ((msg = "작성자 입력해주세요"), (err = false), this.$refs.writer.focus());
            err && !this.article.title && ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
            err && !this.article.content && ((msg = "내용 입력해주세요"), (err = false), this.$refs.content.focus());

            if (!err) alert(msg);
            else this.type === "register" ? this.registArticle() : this.modifyArticle();
        },
        onReset(event) {
            event.preventDefault();
            this.article.no = 0;
            this.article.title = "";
            this.article.content = "";
            this.moveList();
        },
        registArticle() {
            let board = {
                title: this.article.title,
                writer: this.article.writer,
                content: this.article.content,
            }

            http({
                url: "/board",
                method: "post",
                data: board,
            }).then(({ data }) => {
                let msg = "글 등록 중 문제 발생";

                if (data == 'success') msg = "글 등록 완료 !";
                alert(msg);
                this.$router.push(({ name: "board" }));
            });
        },
        modifyArticle() {
            http
                .put(`/board`, {
                    articleno: this.article.no,
                    userid: this.article.writer,
                    subject: this.article.title,
                    content: this.article.content,
                })
                .then(({ data }) => {
                    let msg = "수정 처리시 문제가 발생했습니다.";
                    if (data === "success") {
                        msg = "수정이 완료되었습니다.";
                    }
                    alert(msg);
                    // 현재 route를 /list로 변경.
                    this.moveList();
                });
        },
        moveList() {
            this.$router.push({ name: "boardlist" });
        },
    },
};
</script>
  
<style>

</style>