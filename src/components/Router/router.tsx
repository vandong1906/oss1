import Home from "@components/layout/Home";
import Product from "@components/Product/Product";
import {BrowserRouter,Route, Routes} from "react-router-dom";
import * as React from 'react';
import { IAuthContext, useAuthentication} from "@components/ContextGlobal/Authuciance";
import ManagingProduct from "@components/table/ManagingProduct";
import UserProduct from "@components/table/UserProduct";
import UserProfile from "@components/SettingUser/UserProfile";
import SiderBarMenu from "@components/table/SiderBarMenu";
import Verify from "@components/Form/Veryfi";
<<<<<<< HEAD
=======
import OrderItem from "@components/table/OderItem";
>>>>>>> dong

function Router() {
    const authContextValue: IAuthContext = useAuthentication();
    const publicRouter = [
        {
            component: <SiderBarMenu/>, path: "/SiderBarMenu"
        },
        {
            component: <Home/>, path: "/"
          
        },
        {
            component: <Verify/>, path: "/register/verify"
           
        },
        {
            component: <Product/>, path: "/product"
        }

    ]
    const privateRouter = [
        {
            component: <ManagingProduct/>, path: "/ManagingProduct"
        },
        {
            component: <UserProduct/>, path: "/UserProduct"
        },
        {
            component: <UserProfile/>, path: "/UserProfile"
        },{
               component: <OrderItem/>, path: "/oderItems"
        }
    ]
    return (
        <>

                <BrowserRouter>
                    <Routes>
                        {
                            publicRouter.map((router, index) => {
                                return <Route key={index} element={router.component} path={router.path}/>
                            })
                        }
                        {
                            authContextValue.login && privateRouter.map((router, index) => {
                                return <Route key={index} element={router.component} path={router.path}/>
                            })
                        }

                    </Routes>
                </BrowserRouter>

        </>
    )
}
export default Router;