import {IProduct} from "@components/Types/Product";

export interface IOrderItem {
    orderItemId: number;
    orderId: number;
    productId: number;
    quantity: number;
    price: number; // Price at the time of the order
    product: IProduct;
}