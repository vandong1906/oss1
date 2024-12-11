import {useEffect, useState} from "react";
import Cookies from "js-cookie";
import {IProduct} from "@components/Types/Product";


function CardItem() {
    const [item, setItem] = useState<IProduct[]>();
    useEffect(() => {
        if (Cookies.get("item")) {
            const data = Cookies.get("item");
            if (data != null) {
                setItem(JSON.parse(data));
            }
        }
    }, [])
    const setItemProduct = (product: IProduct) => {
        setItem((prevState) => {
            console.log('Previous state:', prevState)
            if (prevState != null) {
                return [...prevState, product];
            }
            return prevState;
        });
    };
    const removeProduct = (id:number) => {
        setItem((prevState) => {
            if (prevState != null) {
                return prevState.filter((product) => product.product_id !== id);
            }
        });
    };
    const deleteProduct = () => {
        Cookies.remove("item");
    }
    const getItem = () => {
        return item;
    }
    return {setItemProduct, getItem,removeProduct,deleteProduct};
}
export default CardItem;