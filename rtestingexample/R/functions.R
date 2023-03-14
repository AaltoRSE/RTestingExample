
add <- function(a,b){
    return(a + b);
}

subtract <- function(a,b){
    return(a - b);
}

multiply <- function(a,b){
    return(a * b);
}

convert_fahrenheit_to_celsius <- function(fahrenheit){
    C_temp <- multiply(subtract(fahrenheit,32),5/9);
    return(C_temp);
}