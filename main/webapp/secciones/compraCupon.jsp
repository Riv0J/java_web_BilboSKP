<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Cupon"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compra de cupones</title>
</head>
<body>
<h2>Comprar cupones</h2>
    <div id="cajaContenido">
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>1 cupon</h3>
            <h5>5% de descuento</h5>
            <button name="comprar1" type="submit">Comprar ya</button>
            </div>
        
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>3 cupones</h3>
            <h5>11% de descuento</h5>
            <button name="comprar3" type="submit">Comprar ya</button>
        </div>
    
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>5 cupones</h3>
            <h5>17% de descuento</h5>
            <button name="comprar5" type="submit">Comprar ya</button>
        </div>
        
        <div class="cajaCupon">
            <img src="../img_web/icons/coupon.png" width="40%" height="100px">
            <h3>7 cupones</h3>
            <h5>25% de descuento</h5>
            <button name="comprar7" type="submit">Comprar ya</button>
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

</style>
</body>
</html>