<template>
    <div>
        <div class="container">
            <b-card bg-variant="light">
                <b-form-group label-cols-lg="3" label="글 상세보기" label-size="lg" label-class="font-weight-bold pt-0"
                    class="mb-0">
                    <b-form-group label="글번호:" label-for="nested-street" label-cols-sm="2" label-align-sm="right">
                        <b-form-input v-model="article.no" readonly></b-form-input>
                    </b-form-group>

                    <b-form-group label="글제목:" label-for="nested-city" label-cols-sm="2" label-align-sm="right">
                        <b-form-input id="input-2" v-model="article.title" type="text" placeholder="글 제목" readonly
                            required>
                        </b-form-input>
                    </b-form-group>

                    <b-form-group label="작성자:" label-for="nested-state" label-cols-sm="2" label-align-sm="right">
                        <b-form-input id="input-3" v-model="article.writer" placeholder="작성자" readonly required>
                        </b-form-input>
                    </b-form-group>

                    <b-form-group label="내용:" label-for="nested-country" label-cols-sm="2" label-align-sm="right">
                        <b-form-textarea id="input-4" v-model="article.content" placeholder="내용..." readonly required>
                        </b-form-textarea>
                    </b-form-group>
                    <div>
                        <b-button-group>
                            <b-button :to="{ name: 'boardmodify', params: { no: article.no } }" variant="outline-primary" >수정
                            </b-button>
                            <b-button @click="deleteArticle(article)" variant="outline-danger">삭제</b-button>
                            <b-button :to="{ name: 'boardlist' }" variant="outline-info">목록</b-button>
                        </b-button-group>
                    </div>
                </b-form-group>
            </b-card>
        </div>
    </div>
</template>
<script>
import http from "@/util/http-common";

export default {
    name: "BoardView",
    data() {
        return {
            article: {
                no: "",
                title: "",
                writer: "",
                content: "",
            }
        };
    },

    created() {
        http({
            url: `/board/${this.$route.params.no}`,
            method: "get"
        }).then(({ data }) => {
            this.article = data;
        });
    },
    methods: {
        deleteArticle(article) {
            let check = confirm("정말 삭제하시겠습니까?");
            if (!check) return;
            // 파라미터 board를 "/board/board.no"로 method: delete 해줘서 data 받기 => return : success or fail  
            http({
                url: `/board/${article.no}`,
                method: "delete",
            }).then(({ data }) => {
                let msg = "글 삭제 중 에러 발생 !";

                if (data == "success") msg = "글 삭제 완료 !";
                alert(msg);
                this.$router.push(({ name: "board" }));
            })
        },
    }
}
</script>

<style>

</style>
