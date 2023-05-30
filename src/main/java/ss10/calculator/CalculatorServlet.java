package ss10.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operator = request.getParameter("operator");
        double num1 = Integer.parseInt(request.getParameter("firstNumber"));
        double num2 =Integer.parseInt(request.getParameter("secondNumber"));
        double result = 0;
        if(operator.equals("Addition")){
            result = num1 + num2;
        }else if(operator.equals("Subtraction")){
            result = num1 - num2;
        }else if(operator.equals("Division")){
            try{
                result = num1 / num2;
            }catch (ArithmeticException e){
                System.out.println("Can not divide by 0");
            }
        }else {
            result = num1*num2;
        }
        request.setAttribute("firstNumber",num1);
        request.setAttribute("secondNumber",num2);
        request.setAttribute("operand",request.getParameter("operator"));
        request.setAttribute("Result", result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ss10/calculator_jsp/result.jsp");
        requestDispatcher.forward(request,response);
    }
}
