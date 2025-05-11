-- Input: 2, 3, Expected Output: (10, 7, 4)
begin
    read(A);
    read(B);
    C := A * B;
    D := C + (A * (B - 1));
    E := D - (C / A);
    write(D, E, B + 1);
end 