import { useEffect, useState } from "react";
import Cookies from "js-cookie";
import { IProduct } from "@components/Types/Product";

function CardItem() {
    const [item, setItem] = useState<IProduct[]>([]);
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
 Cookies.set("item", JSON.stringify(prevState), { expires: 7 });
                return [...prevState, product];
            } 
     
   
            return prevState;
        });
    };
    const removeProduct = (id: number) => {
        setItem((prevState) => {
            if (prevState) {
                const updatedItems = prevState.filter((product) => product.product_id !== id);
                Cookies.set("item", JSON.stringify(updatedItems), { expires: 7 });
                return updatedItems;
            }
            return prevState;
        });
    };
    const deleteProduct = () => {
        Cookies.remove("item");
    }
    const getItem = () => {
        return item;
    }
    return {setItemProduct, getItem, removeProduct, deleteProduct };
}
export default CardItem;