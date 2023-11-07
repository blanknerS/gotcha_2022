import React from 'react'
import './HomePage.css'
import Login from '../Components/Login'
import { auth } from '../config/firebase'


function HomePage() {

  const authenticationScreen = () => {
    if (auth.currentUser) {
      return (
        <div>
          
          
        </div>
      )
    } else {
      return <Login></Login>
    }
  }

  return (
    <div className="HomePage">
      {authenticationScreen()}
    </div>
  )
}

export default HomePage