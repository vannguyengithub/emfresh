<template>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 text-center">
                <ul class="nav nav-pills mb-3 justify-content-between package-header-navbar" id="pills-tab" role="tablist">
                    <li class="nav-item" v-for="(category , index) in categories">
                        <a class="nav-link" :class="index == 0 ? 'active' :''" :id="'category_tab_' + index" data-toggle="pill" :href="'#category_' + index" role="tab" :aria-controls="'#tab' + index" aria-selected="true" v-text="category.name"></a>
                    </li>
                </ul>
            </div>

            <div class="tab-content col-12" id="pills-tabContent">
                <div class="meal-package tab-pane fade show" :class="index == 0 ? 'active' :''" :id="'category_' + index" role="tabpanel" :aria-labelledby="'category_' + index" v-for="(category , index) in categories">
                    <div class="col-md-6 offset-md-3">
                        <div class="blog-avg d-flex justify-content-between">
                            <div class="avg-title">  
                                <div class="title">
                                    Eat clean
                                </div>
                                <div class="content">
                                    Avg. macros
                                </div>
                            </div>

                            <div class="avg-parameter">
                                <div class="title">
                                    30g
                                </div>
                                <div class="content">
                                    Protein
                                </div>
                            </div>
                            <div class="avg-parameter">
                                <div class="title">
                                    10g
                                </div>
                                <div class="content">
                                    Carbs
                                </div>
                            </div>
                            <div class="avg-parameter">
                                <div class="title">
                                    32g
                                </div>
                                <div class="content">
                                    Fat
                                </div>
                            </div>
                            <div class="avg-parameter">
                                <div class="title">
                                    460
                                </div>
                                <div class="content">
                                    Cal
                                </div>
                            </div>
                            <div class="avg-parameter avg-parameter-last">
                                <div class="title">
                                    550mg
                                </div>
                                <div class="content">
                                    Sodium
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row row-mb-cus" v-if="!type.length">
                        <div class="col-md-4 col-8" v-for="(product , i ) in category.products">
                            <div class="meal-package-content text-center">
                                <a class="img" @click="openModal(product)">
                                    <img class="img-fluid" :src="'/storage/' + product.image" width="300" height="300" :alt="product.name">
                                </a>
                                <div class="content" v-text="product.name"></div>
                            </div>
                        </div>
                    </div>

                    <div class="menu-day" v-else-if="type == 'day'">
                        <template v-for="(group , key , index) in category.products">
                            <template v-if="group">
                                <div class="menu-day-header text-center">
                                    <p class="day-text mb-0">
                                        {{ group.day }} <br> {{ group.date }}
                                    </p>
                                </div>
                                <div class="container menu-day-content">
                                    <div class="row" >
                                        <div class="col-md-4" v-for="(product , index ) in group.item">
                                            <div class="meal-package-content text-center">
                                                <a class="img" @click="openModal(product)">
                                                    <img class="img-fluid" :src="'/storage/' + product.image" width="300" height="300" :alt="product.name">
                                                </a>
                                                <div class="content" v-text="product.name"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        </template>
                    </div>
                </div>
            </div>
        </div>
        <ModalMeal :product="product" />
    </div>
</template>

<script>
    import ModalMeal from "./ModalMeal";

    export default {
        components:{
            ModalMeal
        },
   
        data(){
            return {
                categories: [],
                product : [],
                type : this.groupType || ''
            }
        },
        props : {
            groupType : {
                type : String
            }
        },  
        mounted() {
            this.getMeals();
        },
        methods:{
            getMeals(){
                axios.get('/api/meals?type=' + this.type).then(res => {
                    this.categories = res.data.data.categories;         
                })
            },
            openModal(product){
                this.product = product;
                $('#modalInfoMeal').modal('show');
            }
        }
    }
</script>
