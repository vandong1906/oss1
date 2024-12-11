
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
    return {createProduct,getProduct};
}

export default CallProduct;