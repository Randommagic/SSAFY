<template>
    <b-container class="bv-example-row mt-3">
        <b-row>
            <b-col>
                <b-alert show>
                    <h3>글목록</h3>
                </b-alert>
            </b-col>
        </b-row>
        <b-row class="mb-1">
            <b-col class="text-right">
                <b-button variant="outline-primary" @click="moveWrite()">글쓰기</b-button>
            </b-col>
        </b-row>
        <b-row>
            <b-col>
                <div v-if="articles.length">
                    <b-table striped hover id="article-list" :fields="fields" :items="articles">

                        <!-- b-table 안에서 태그에 기능넣고 싶을 떄, template태그 안에서 작성해주면 된다!  -->
                        <!-- 1. 특정 컬럼에 클릭 이벤트 -->
                        <template #cell(title)="data">
                            <router-link :to="`/board/view/${data.item.no}`">{{ data.item.title }}</router-link>
                        </template>
                        <!-- 2. 특정 컬럼에 filtering -->
                        <template #cell(regtime)="data">
                            {{ data.item.regtime | transDate }}
                        </template>
                    </b-table>
                </div>
                <div class="text-center" v-else>게시글이 없습니다.</div>

            </b-col>
        </b-row>
    </b-container>
</template>

<script>
import http from "@/util/http-common";

const root = "http://localhost:9999/api/board";

export default {
    name: "BoardList",
    components: {
    },

    data() {
        return {
            articles: [],
            fields: [
                {
                    key: "no",
                    label: "글번호",
                    sortable: true,
                },
                {
                    key: "title",
                    label: "글제목",
                    sortable: true,
                },
                {
                    key: "writer",
                    label: "작성자",
                    sortable: true,
                },
                {
                    key: "regtime",
                    label: "작성일",
                    sortable: true,
                },
            ],
        };
    },

    created() {
        http({
            url: root,
            method: "get",
        }).then(({ data }) => {
            this.articles = data;
        });
    },
    methods: {
        moveWrite() {
            this.$router.push({ name: "boardwrite" });
        },
    },
    filters: {
        transDate: function (regtime) {

            if (!regtime) return '';

            let js_date = new Date(regtime);

            let year = js_date.getFullYear();
            let month = js_date.getMonth() + 1;
            let day = js_date.getDate();

            if (month < 10) month = "0" + month;
            if (day < 10) day = "0" + day;

            return year + "년 " + month + "월 " + day + "일";
        }
    }
}

</script>
<style>

</style>
