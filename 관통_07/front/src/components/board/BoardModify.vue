<template>
    <div>
        <div class="container">
            <b-card bg-variant="light">
                <b-form-group label-cols-lg="3" label="글 수정하기" label-size="lg" label-class="font-weight-bold pt-0"
                    class="mb-0">
                    <b-form-group label="글번호:" label-for="nested-street" label-cols-sm="2" label-align-sm="right">
                        <b-form-input v-model="board.no" readonly></b-form-input>
                    </b-form-group>

                    <b-form-group label="글제목:" label-for="nested-city" label-cols-sm="2" label-align-sm="right">
                        <b-form-input id="input-2" v-model="board.title" type="text" placeholder="글 제목" required>
                        </b-form-input>
                    </b-form-group>

                    <b-form-group label="작성자:" label-for="nested-state" label-cols-sm="2" label-align-sm="right">
                        <b-form-input id="input-3" v-model="board.writer" placeholder="작성자" required></b-form-input>
                    </b-form-group>

                    <b-form-group label="내용:" label-for="nested-country" label-cols-sm="2" label-align-sm="right">
                        <b-form-textarea id="input-4" v-model="board.content" placeholder="내용..." required>
                        </b-form-textarea>
                    </b-form-group>

                    <div style="padding-top: 15px">
                        <b-button @click="modifyBoard(board)">수정</b-button>
                        <b-button :to="{ name: 'boardview', params: { no: board.no } }" variant="danger">취소</b-button>
                    </div>
                </b-form-group>
            </b-card>
        </div>
    </div>
</template>

<script>
import http from "@/util/http-common";

export default {
    name: "boardmodify",
    created() {
        http({
            url: `/board/${this.$route.params.no}`,
            method: "get"
        }).then(({ data }) => {
            this.board = data;
        }) 
    },
    data() {
        return {
            board: {
                no: "",
                title: "",
                writer: "",
                content: "",
            }
        };
    },
    methods: {
        modifyBoard(board) {
            // 파라미터 board를 "/board/board.no"로 method: put 해줘서 data 받기 => return : success or fail
            http({
                url: `/board/${board.no}`,
                method: "put",
                data: board
            }).then(({ data }) => {
                let check = confirm("해당 정보로 수정하시겠습니까?");
                if (!check) return;

                let msg = "글 수정 중 에러 발생 !";

                if (data == "success") msg = "글 수정 완료 !";
                alert(msg);
                this.$router.push(({ name: "boardview", params: board.no }));
            })

        },
    }
}
</script>

<style>

</style>