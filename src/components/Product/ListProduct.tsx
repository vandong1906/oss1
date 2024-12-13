import CallProduct from "@components/function/CallProduct";
import { IProduct } from "@components/Types/Product";
import { ChevronLeftIcon, ChevronRightIcon } from "@heroicons/react/24/solid"
import clsx from "clsx";
import * as React from 'react';
import { useEffect } from "react";
import { Link } from "react-router-dom";
interface ProductProps {
    ProductName: string;
    Number: number;

}
interface Props {

}
export const ListProduct = ({ }: Props) => {
    const [products, setProduct] = React.useState<IProduct[]>();
    useEffect(() => {
        const fetachdata = async () => {
            const product = await CallProduct().getLimitProduct();
            setProduct(product);
        }
        fetachdata()
    }, [])
    return <>
        <div className="Items border-2 p-7 m-7">
            <div className="ListProduct grid grid-cols-4 gap-4">
                {
                    products?.map((product,index) => (

                        <div className="Card border-2 text-center" key={index}>
                            <Link to={clsx('/product?product='+product.product_id)}>
                                <img className="rounded-t-lg transition-all duration-300 rounded-lg cursor-pointer filter grayscale hover:grayscale-0 h-52 w-full" src={import.meta.env.VITE_API_URL +'/uploads/'+ product.image_data} alt="" />
                            </Link>
                            <div className="title p-5">
                                <h1 className="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"> This is a card first i create</h1>
                                <p className="mb-3 font-normal text-gray-700 dark:text-gray-400 Text-">after that this is detail</p>
                                <a href="#" className="inline-flex items-center rounded-lg bg-blue-700 px-3 py-2 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    Buy
                                </a>
                            </div>
                        </div>
                    ))
                }

            </div>
            <div className="Pagnigation flex justify-center items-center gap-3">
                <button type="submit" ><ChevronLeftIcon className="h-6" /></button>
                <button type="submit" className="border-2 p-2"> 1</button>
                <button type="submit" className="border-2 p-2"> 2</button>
                <button type="submit" ><ChevronRightIcon className="h-6" /> </button>
            </div>
        </div>

    </>
}