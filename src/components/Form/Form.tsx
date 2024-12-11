
import clsx from 'clsx';
import * as React from 'react';
import CallUser from "@components/function/CallUser";
import {IAuthContext, useAuthentication} from "@components/ContextGlobal/Authuciance";

const Form = () => {
    const [State, setState] = React.useState(false);
    const [User_Name, setName] = React.useState('');
    const [password, setPassword] = React.useState('');

const authContextValue:IAuthContext=useAuthentication();
   async function login() {
        const response = await CallUser().login({User_Name, password});
        console.log(response);
        if(response){
       authContextValue.setUser(response);
       console.log(authContextValue.login);
        }
    }

    return <>
        <div className={clsx("flex items-center justify-center min-h-screen inset-0 fixed bg-black opacity-85")}>
            <form onSubmit={(event) => {
                event.preventDefault();
                login()
            }}
                  className={clsx("bg-white p-8 rounded-lg shadow-lg w-full max-w-lg max-h-lg", State ? "hidden" : "block")}>
                <h2 className="text-2xl font-bold text-center mb-6">Login Form</h2>
                <div className="flex justify-center mb-6">
                    <button
                        className="bg-gradient-to-r from-blue-500 to-blue-700 text-white py-2 px-4 rounded-l-full">Login
                    </button>
                    <button className="bg-white text-black py-2 px-4 rounded-r-full border border-gray-300"
                            onClick={() => {
                                setState(!State);
                            }}>Signup
                    </button>
                </div>
                <div className="mb-4">
                    <input type="text" placeholder="Email Address"
                           className="w-full p-3 border border-gray-300 rounded-lg"
                           onChange={
                               (event) => {
                                   setName(event.target.value);
                               }
                           }/>
                </div>
                <div className="mb-4">
                    <input type="password" placeholder="Password"
                           className="w-full p-3 border border-gray-300 rounded-lg"
                           onChange={(event) => {
                               setPassword(event.target.value);
                           }}
                    />
                </div>
                <div className="mb-4 text-right">
                    <a href="#" className="text-blue-500">Forgot password?</a>
                </div>
                <div className="mb-4">
                    <button
                        className="bg-gradient-to-r from-blue-500 to-blue-700 text-white w-full py-3 rounded-lg">Login
                    </button>
                </div>
                <div className="text-center">
                    <span>Create an account </span>
                    <a href="#" className="text-blue-500">Signup now</a>
                </div>
            </form>

            {/*                               Register                              */}
            <div className={clsx("bg-white p-8 rounded-lg shadow-lg w-full max-w-sm", State ? "block" : "hidden")}>
                <h2 className="text-2xl font-bold text-center mb-6">Register Form</h2>
                <div className="flex justify-center mb-6">
                    <button className="bg-gradient-to-r from-blue-500 to-blue-700 text-white py-2 px-4 rounded-l-full"
                            onClick={() => {
                                setState(!State);
                            }}>Login
                    </button>
                    <button className="bg-white text-black py-2 px-4 rounded-r-full border border-gray-300">Signup
                    </button>
                </div>
                <div className="mb-4">
                    <input type="email" placeholder="Email Address"
                           className="w-full p-3 border border-gray-300 rounded-lg"/>
                </div>
                <div className="mb-4">
                    <input type="password" placeholder="Password"
                           className="w-full p-3 border border-gray-300 rounded-lg"/>
                </div>
                <div className="mb-4 text-right">
                    <a href="#" className="text-blue-500">Forgot password?</a>
                </div>
                <div className="mb-4">
                    <button
                        className="bg-gradient-to-r from-blue-500 to-blue-700 text-white w-full py-3 rounded-lg">Login
                    </button>
                </div>
                <div className="text-center">
                    <span>Create an account </span>
                    <a href="#" className="text-blue-500">Signup now</a>
                </div>
            </div>
        </div>
    </>

}

export default Form;