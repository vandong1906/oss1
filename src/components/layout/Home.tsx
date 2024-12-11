
import Banner from "@components/Banner/Banner";
import NavBar from "@components/Navbar/navbar";
import { ListProduct } from "@components/Product/ListProduct";
import React from "react";
import {useAuthentication} from "@components/ContextGlobal/Authuciance";

const Home:React.FC=()=>{

    return <>
     <NavBar/>
     <Banner/>
     <ListProduct/>
    </>
}

export default Home;