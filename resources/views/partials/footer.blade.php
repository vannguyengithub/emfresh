{{-- <footer>
    <div class="footer-content container">
        <div class="made-with">Made with <i class="fa fa-heart heart"></i> by Andre Madarang</div>
        {{ menu('footer', 'partials.menus.footer') }}
    </div> <!-- end footer-content -->
</footer> --}}

<footer class="footer">
    <div class="max-w-1120 container">
        <div class="row">
            <div class="col-sm-3">
                <h3 class="logo-footer">
                    <a href="/" >
                        <img src="{{ asset( 'storage/' .setting('site.logo'))}}" alt="{{ setting('site.title')}}" />
                    </a>
                </h3>
                <ul>
                    <li>Địa chỉ: {{ setting('site.address')}}</li>
                    <li>Điện thoại: {{ setting('site.phone')}}</li>
                    <li>Email: {{ setting('site.email') }}</li>
                    <li>MST: {{ setting('site.info_mst') }}</li>
                </ul>
            </div>
            <div class="col-sm-3">
                <h3>Hỗ trợ khách hàng</h3>
                {{ menu('Hỗ trợ khách hàng' , 'partials.menus.footer')}}
            </div>
            <div class="col-sm-3">
                <h3>Về em.fresh</h3>        
                {{ menu('Về em.fresh' , 'partials.menus.footer')}}
            </div>
            <div class="col-sm-3">
                <h3>Theo dõi em.fresh</h3>        
                <ul class="social">
                    <li><a href="#"><img src="./assets/images/phone.png" width="20" height="20" alt="phone"></a></li>
                    <li><a href="#"><img src="./assets/images/fb.png" width="20" height="20" alt="facebook"></a></li>
                    <li><a href="#"><img src="./assets/images/ig.png" width="20" height="20" alt="instagram"></a></li>                  
                </ul>
                <div class="copyright">© 2022 Em.fresh</div>
            </div>
        </div>
    </div>
</footer>
