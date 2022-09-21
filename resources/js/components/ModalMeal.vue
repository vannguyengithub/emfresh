<template>
    <div class="modal fade modal-info" id="modalInfoMeal" tabindex="-1" role="dialog" aria-labelledby="modalInfoMealTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content modal-info-content">
                <div class="modal-header modal-info-header d-block text-center">
                    <h2 class="modal-title" id="modalInfoMealTitle">
                    
                    </h2>
                    <button type="button" class="close d-none" data-dismiss="modal" aria-label="Close">
                        <img class="img-fluid" src="/assets/images/icon_close.png" alt="">
                    </button>
                </div>

                <div class="modal-body modal-info-body">
                    <div class="faqs-box" v-if="product_data">
                        <div id="accordion">
                            <!-- Thông tin dinh dưỡng -->
                            <div class="card">
                                <div class="card-header" id="heading_1">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link faqs-btn__custome" data-toggle="collapse" data-target="#collapse_1" aria-expanded="true" aria-controls="collapse1">
                                            <span>
                                                Thông tin dinh dưỡng
                                            </span>    
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse_1" class="" aria-labelledby="heading1" data-parent="#accordion">
                                    <div class="card-body table-info-nutrition d-block">
                                        <div class="nutrition-header">
                                            <p class="mb-0">1 khẩu phần ăn cho mỗi suất</p>
                                        </div>
                                        <div class="table-responsive nutrition-table" v-html="product.description">
                                            
                                        </div>
                                        <div class="nutrition-footer d-flex align-items-center">
                                            <div class="icon-label mr-3">
                                                <img class="img-fluid" src="/assets/images/info_circle.png" alt="">
                                            </div>
                                            <div class="content">
                                                <p class="mb-0">
                                                    Tỷ lệ dinh dưỡng có thể thay đổi tuỳ thuộc vào thời điểm giao hàng và cách bảo quản 
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Nguyên liệu -->
                            <div class="card">
                                <div class="card-header" id="heading_2">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link faqs-btn__custome" data-toggle="collapse" data-target="#collapse_2" aria-expanded="true" aria-controls="collapse2">
                                            <span>
                                                Nguyên liệu
                                            </span>    
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse_2" class="" aria-labelledby="heading2" data-parent="#accordion">
                                    <div class="card-body d-block" v-html="product.ingredient">
                                    </div>
                                </div>
                            </div>

                            <!-- Hướng dẫn sử dụng -->
                            <div class="card">
                                <div class="card-header" id="heading_3">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link faqs-btn__custome" data-toggle="collapse" data-target="#collapse_3" aria-expanded="true" aria-controls="collapse3">
                                            <span>
                                                Hướng dẫn sử dụng
                                            </span>    
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse_3" class="" aria-labelledby="heading3" data-parent="#accordion">
                                    <div class="card-body d-block" v-html="product.user_manual"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                product_data : this.product
            }
        },
        props:{
            product : {
                require : true,
                type : [Object, Array]
            }
        },
    }
</script>