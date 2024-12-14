import { useState } from "react";
import { useLocation } from "react-router-dom";
import * as React from 'react';
import axios from "axios";
import axiosInstance from "@components/CustomAxios/AxiosCustom";
import { IProduct } from "@components/Types/Product";
import NavBar from "@components/Navbar/navbar";

const Product = () => {
    const local = useLocation();
    const param = new URLSearchParams(local.search);
    const [data, setData] = useState<IProduct>();
    const [loading, SetLoading] = useState(false);
    console.log(param.get('product'));
    React.useEffect(() => {
        const handler = async () => {
            try {
                const response = await axiosInstance.get(import.meta.env.VITE_API_URL + '/v1/product/where/' + param.get('product'));
                setData(response.data);
               
                SetLoading(true);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        }
        handler();

    }, [])
    return <>
    <NavBar/>
        <div className="p-4 md:p-8">
            <nav className="text-sm text-gray-500 mb-4">
                <a href="#" className="hover:underline">Nike Court</a> &gt;
                <a href="#" className="hover:underline"> Nike Tennis</a> &gt;
                <a href="#" className="hover:underline"> Nike Zoom Vapor</a>
            </nav>
            <div className="md:flex">
                <div className="md:w-1/2">
                    {
                        loading && (
                            <img src={import.meta.env.VITE_API_URL +'/uploads/'+ data?.image_data} alt="Nike Zoom Vapor Pro 2 HC ‘White’ DR6191-101" className="w-3/4 h-1/2 mb-4" />
                        )
                    }

                    <div className="flex space-x-2">
                        <img src="https://placehold.co/100x100" alt="Side view of Nike Zoom Vapor Pro 2 HC ‘White’" className="w-1/5" />
                        <img src="https://placehold.co/100x100" alt="Person wearing Nike Zoom Vapor Pro 2 HC ‘White’ on a tennis court" className="w-1/5" />
                        <img src="https://placehold.co/100x100" alt="Person sitting on a tennis court wearing Nike Zoom Vapor Pro 2 HC ‘White’" className="w-1/5" />
                        <img src="https://placehold.co/100x100" alt="Person playing tennis wearing Nike Zoom Vapor Pro 2 HC ‘White’" className="w-1/5" />
                    </div>
                </div>
                <div className="md:w-1/2 md:pl-8">
                    <h1 className="text-xl md:text-2xl font-bold mb-2">Giày Nike Zoom Vapor Pro 2 HC ‘White’ DR6191-101</h1>
                    <p className="text-lg md:text-xl text-red-500 mb-4">3,100,000 ₫ – 3,500,000 ₫</p>
                    <div className="mb-4">
                        <span className="text-sm text-gray-500">Kích thước</span>
                        <div className="flex flex-wrap space-x-2 mt-2">
                            <button className="border border-gray-300 rounded-full px-4 py-2 mb-2">40.5</button>
                            <button className="border border-gray-300 rounded-full px-4 py-2 mb-2">41</button>
                            <button className="border border-gray-300 rounded-full px-4 py-2 mb-2">42</button>
                            <button className="border border-gray-300 rounded-full px-4 py-2 mb-2">42.5</button>
                            <button className="border border-gray-300 rounded-full px-4 py-2 mb-2">43</button>
                            <button className="border border-gray-300 rounded-full px-4 py-2 mb-2">44</button>
                        </div>
                    </div>
                    <div className="border border-gray-300 p-4 mb-4">
                        <div className="flex items-center mb-2">
                            {/* <PhoneIcon className="text-blue-500 mr-2 h-16" /> */}
                            <span className="text-sm">Gọi ngay để có giá tốt</span>
                        </div>
                        <p className="text-sm mb-1">Hotline HN : 0984918486 - 0785499555 - 72 Tây Sơn Đống Đa</p>
                        <p className="text-sm">Hotline HCM : 0786665444 - 561 Nguyễn Đình Chiểu Q.3</p>
                        <p className="text-sm text-gray-500">Tổng đài hoạt động từ 10h00 - 22h00 mỗi ngày</p>
                    </div>
                    <button className="w-full bg-pink-200 text-white py-3 rounded mb-4 hover:bg-pink-500" >THÊM VÀO GIỎ HÀNG</button>
                    <div className="flex flex-col md:flex-row space-y-2 md:space-y-0 md:space-x-2 mb-4">
                        <button className="w-full md:w-1/3 bg-red-500 text-white py-3 rounded">MUA NGAY<br />Giao Tận Nơi Hoặc Nhận Tại Cửa Hàng</button>
                        <button className="w-full md:w-1/3 bg-blue-500 text-white py-3 rounded">TRẢ GÓP QUA THẺ<br />Visa, Master, JCB</button>
                        <button className="w-full md:w-1/3 bg-yellow-500 text-white py-3 rounded">MUA NGAY - TRẢ SAU<br />HOME PayLater</button>
                    </div>
                    <ul className="text-sm text-gray-500 space-y-2">
                        <li>Hệ Thống Cửa Hàng</li>
                        <li>Cam Kết Khách Hàng</li>
                        <li>Chính Sách Đổi Trả, Bảo Hành</li>
                        <li>Chính Sách Vận Chuyển</li>
                    </ul>
                </div>
            </div>
        </div>
</>
}
export default Product;