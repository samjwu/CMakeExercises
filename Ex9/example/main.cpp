#include "calculator.h"
#include "calculator_headeronly.h"

int main() {
    Calculator calc1;
    calc1.Add(1, 2);

    CalculatorHeaderOnly calc2;
    calc2.Add(1, 2);

    return 0;
}
