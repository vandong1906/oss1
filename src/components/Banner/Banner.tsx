import * as React from 'react';
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import 'swiper/css/pagination';
import 'swiper/css/navigation';
import myImage from "../../assets/Giay-Nau.webp";
import myImage1 from "../../assets/image-54-2048x711-2.webp";
import { Autoplay, Pagination, Navigation } from 'swiper/modules';
const Banner = () => {
<<<<<<< HEAD
    const [currentIndex, setCurrentIndex] = React.useState(0);

=======
>>>>>>> dong
    const images = [
       myImage,
       myImage1,    
    ];

    return <>
        <Swiper
        spaceBetween={30}
        centeredSlides={true}
        autoplay={{
<<<<<<< HEAD
          delay: 2500, // Tự động chuyển sau 2.5 giây
          disableOnInteraction: false, // Cho phép tiếp tục tự động sau khi tương tác
        }}
       
        navigation={true} // Thêm điều hướng next/prev
        modules={[Autoplay, Navigation]} // Import các module cần thiết
=======
          delay: 2500, 
          disableOnInteraction: false,
        }}
       
        navigation={true} 
        modules={[Autoplay, Navigation]} 
>>>>>>> dong
        className="mySwiper"
      >
        {images.map((image, index) => (
          <SwiperSlide key={index}>
            <div className="flex items-center justify-center">
              <img
                src={image}
                alt={`Slide ${index + 1}`}
                className="w-full h-auto max-h-dvh object-contain rounded-lg"
              />
            </div>
          </SwiperSlide>
        ))}
      </Swiper>
    </>
}

export default Banner;