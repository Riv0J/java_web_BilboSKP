<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Cupon"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compra de cupones</title>
<script src="./js/botonesConfeti.js"></script>
</head>
<body>
<h2>Comprar cupones</h2>
    <div id="cajaContenido">
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>1 cupon</h3>
            <h5>5% de descuento</h5>
            <div id="root"></div>
            </div>
        
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>3 cupones</h3>
            <h5>11% de descuento</h5>
            <div id="root"></div>
        </div>
    
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>5 cupones</h3>
            <h5>17% de descuento</h5>
            <div id="root"></div>
        </div>
        
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>7 cupones</h3>
            <h5>25% de descuento</h5>
            <div id="root"></div>
            </div>
        </div>
</div>
<style>
   #cajaContenido{
   /*border: #000 solid 1px;*/
   width: 90%;
   height: 30em;
   display: flex;
   justify-content: center;
   margin-left: 5%;
   margin-top: 3em;
    }
    * {
  box-sizing: border-box;
}
    
    h2{
        margin-left: 45%;
    }
.cajaCupon{
    padding-top: 0.3em;
    padding-bottom: 2.8em;
    margin: 1em;
    border-radius: 8%;
    border: 1px solid #000;
    width: 13em;
    height: 12em;
    display: flex;
    align-items: center;
    flex-direction: column;
    
}
button {
  cursor: pointer;
  font: inherit;
  margin: 0;
  padding: 0;
  }
.button {
  background-color: #404663;
  color: #fff;
  border: 0;
  font-size: 2rem;
  font-weight: 400;
  padding: 0.5em 1.25em;
  border-radius: 0.5em;
  z-index: 999;
  position: relative;
  display: flex;
  gap: 0.5em;
  box-shadow:
    0px 1.7px 2.2px rgba(0, 0, 0, 0.02),
    0px 4px 5.3px rgba(0, 0, 0, 0.028),
    0px 7.5px 10px rgba(0, 0, 0, 0.035),
    0px 13.4px 17.9px rgba(0, 0, 0, 0.042),
    0px 25.1px 33.4px rgba(0, 0, 0, 0.05),
    0px 60px 80px rgba(0, 0, 0, 0.07);
}

.button:active {
  transform: scale(1.01);
}
    
     


</style>

</body>
</html>