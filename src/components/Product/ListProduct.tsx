import { ChevronLeftIcon, ChevronRightIcon } from "@heroicons/react/24/solid"
import * as React from 'react';
interface ProductProps {
    ProductName: string;
    Number: number;

}
interface Props {

}
export const ListProduct = ({ }: Props) => {

    const a = import.meta.env.VITE_APP_NAME;
    console.log(a);
    return <>
        <div className="Items border-2 p-7 m-7">
            <div className="ListProduct grid grid-cols-4 gap-4">
                <div className="Card border-2 text-center">
                    <img src="https://toplist.vn/images/800px/giay-sneaker-nu-729209.jpg" alt="#" className="" />
                    <div className="title">
                        <h1> This is a card first i create</h1>
                        <p>after that this is detail</p>
                    </div>
                </div>
                <div className="Card border-2 text-center">
                    <img src="https://toplist.vn/images/800px/giay-sneaker-nu-729209.jpg" alt="#" className=" " />
                    <div className="title">
                        <h1> This is a card first i create</h1>
                        <p>after that this is detail</p>
                    </div>
                </div>
                <div className="Card border-2 text-center">
                    <img src="https://toplist.vn/images/800px/giay-sneaker-nu-729209.jpg" alt="#" className="" />
                    <div className="title">
                        <h1> This is a card first i create</h1>
                        <p>after that this is detail</p>
                    </div>
                </div>
                <div className="Card border-2 text-center">
                    <img src="https://toplist.vn/images/800px/giay-sneaker-nu-729209.jpg" alt="#" className="   " />
                    <div className="title">
                        <h1> This is a card first i create</h1>
                        <p>after that this is detail</p>
                    </div>
                </div>
                <div className="Card border-2 text-center">
                    <img src="https://toplist.vn/images/800px/giay-sneaker-nu-729209.jpg" alt="#" className="   " />
                    <div className="title">
                        <h1> This is a card first i create</h1>
                        <p>after that this is detail</p>
                    </div>
                </div>
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