
import axiosInstance from "@components/CustomAxios/AxiosCustom";
import axios from "axios";
function CallProduct(){
    const createProduct = async (Product: FormData) => {
        try {
            console.log("Form data being sent:", Product);

            // Send the FormData to the server
            const response = await axios.post("http://localhost:3000/v1/product", Product);
            //  const response = await axiosInstance.post("/v1/product", Product);

            console.log("Response from server:", response);
            return response;
        } catch (error) {
            console.error("Error creating product:", error);
            throw error; // Optionally, handle the error as needed
        }
    };
    const getProduct = async () => {
        const response = await axiosInstance.get("http://localhost:3000/v1/product");
        return response.data;

    }
    const getLimitProduct = async () => {
        const response = await axiosInstance.get(import.meta.env.VITE_API_URL+"/v1/product/limit");
        return response.data;

    }
    return {createProduct,getProduct,getLimitProduct};
}

export default CallProduct;