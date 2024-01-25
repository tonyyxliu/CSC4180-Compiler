-- Input: (1, 2), Expected Output: (2, 3, 5)
begin 
    read(A, C);
    A := A + (1 - C)+ 2;
    C := A + 1;
    write(A, C, A + A + C);
end