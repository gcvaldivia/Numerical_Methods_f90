REAL(8) FUNCTION f(x) RESULT(res) 
        REAL(8),INTENT(IN)  :: x
        res=7/(x**2+1)
END FUNCTION f

PROGRAM ex2a
        IMPLICIT NONE
        INTEGER(8), DIMENSION(4) :: m
        REAL(8) :: a,b,h,X,XI,XI0,XI1
        INTEGER(8) :: i,j,n
        REAL(8), EXTERNAL :: f
        PRINT*,""
        PRINT*,"Let us compute the integral of the function f(x)=7/(x^2+1)"
        PRINT*,"from 0 to 5 applying the Composite Trapezoidal rule:"
        PRINT*,""

        m=(/12,24,36,48/)
        PRINT'(A37)',"Approximate Result"
        PRINT*,""
        DO j=1,4
                n=m(j)
                a=0
                b=5
                h=(b-a)/n
                XI0=f(a)+f(b)
                XI1=0

                DO i=1,n-1
                        X=a+i*h
                        XI1=XI1+f(X)
                END DO
                XI=h*(XI0+2*XI1)/2
                PRINT '(A3,I2,A1,F31.20,F31.20)',"n=",n,":",XI
        END DO
        
        PRINT*,"Exact result: 9.61380536861511102603"
        PRINT*,''
END PROGRAM ex2a
