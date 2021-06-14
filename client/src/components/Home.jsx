import React　from 'react';
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const Home = () => {
    const settings = {
        autoplay: true,
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        centerMode: true,
        centerPadding: "33%"
    };
    return (
        <Slider {...settings}>
            <li className="slider-item">
                <a href="https://www.pokemon-card.com/products/s/s7.html" target="blank">
                    <img class src="https://www.pokemon-card.com/assets/images/index/slides/s7_slider.jpg"/>
                </a>
            </li>
            <li className="slider-item">
                <a href="https://www.pokemon-card.com/ex/sh/" target="blank">
                    <img class src="https://www.pokemon-card.com/assets/images/index/slides/SH_slider.jpg"/>
                </a>
            </li>
            <li className="slider-item">
                <a href="https://www.pokemon-card.com/products/s/sp5.html" target="blank">
                    <img src="https://www.pokemon-card.com/assets/images/index/slides/sp5_slider.jpg"/>
                </a>
            </li>
            <li className="slider-item">
                <a href="https://www.pokemon-card.com/ex/ichigeki/" target="blank">
                    <img src="https://www.pokemon-card.com/assets/images/index/slides/s5_ichigeki.jpg"/>
                </a>
            </li>
            <li className="slider-item">
                <a href="https://www.pokemon-card.com/ex/rengeki/" target="blank">
                    <img src="https://www.pokemon-card.com/assets/images/index/slides/s5_slide_rengeki.jpg"/>
                </a>
            </li>
            <li className="slider-item">
                <a href="https://www.pokemon-card.com/info/2020/20200529_002428.html" target="blank">
                    <img src="https://www.pokemon-card.com/assets/images/index/slides/remote.jpg"/>
                </a>
            </li>
        </Slider>
    );
}

export default Home;