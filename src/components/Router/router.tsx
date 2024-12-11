import Home from "@components/layout/Home";
import Product from "@components/Product/Product";
import {BrowserRouter,Route, Routes} from "react-router-dom";
import * as React from 'react';
import { IAuthContext, useAuthentication} from "@components/ContextGlobal/Authuciance";
import ManagingProduct from "@components/table/ManagingProduct";
import UserProduct from "@components/table/UserProduct";
import UserProfile from "@components/SettingUser/UserProfile";

function Router() {
    const authContextValue: IAuthContext = useAuthentication();
    const publicRouter = [
        {
            component: <Home/>, path: "/"
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