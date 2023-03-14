

test_that(desc = "Fahrenheit to Celsius", code = {
  
  temp_C <- convert_fahrenheit_to_celsius(50); # Runs the function
  
  # Test that the result is the correct value
  expect_equal(temp_C, 10 );
  
  # Test that the result is numeric
  expect_true(is.numeric(temp_C));
})



test_that(desc = "Add", code = {  
  c <- add(2,3);   
  expect_equal( c, 5 );
  expect_true(is.numeric(c));
})



test_that(desc = "Subtract", code = { 
  c <- subtract(3,2); 
  expect_equal( c, 1 );
  expect_true(is.numeric(c));
})

test_that(desc = "Multiply", code = {
    c <- multiply(3,2); 
  expect_equal( c, 6 );
  expect_true(is.numeric(c));
})