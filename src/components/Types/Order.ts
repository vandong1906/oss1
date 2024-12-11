import {IOrderItem} from "@components/Types/OrderItem";

export interface IOrder {
    orderId: number;
    userId: number;
    orderDate: string;
    totalPrice: number;
    status: string;
    orderItems: IOrderItem[];
}