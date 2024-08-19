function next_state = next_state(vector,i)

switch i
    case 1
        next_state = vector(1);
    case 2
        next_state = 1;
    case 3
        next_state = ~vector(4) && vector(2);
    case 4
        next_state = vector(1);
    case 5
        next_state = vector(9) || (vector(4) && ~vector(2));
    case 6
        next_state = ~vector(9) && (vector(7) || vector(11)) ;
    case 7
        next_state = vector(4) && vector(1);
    case 8
        next_state = vector(11) || vector(9) || vector(6) || (vector(4) && vector(2));
    case 9
        next_state = 0;
    case 10
        next_state =  (vector(8) && vector(13)) || vector(11) || (vector(9) && vector(5)) || (vector(3) && vector(13)) || vector(12);
    case 11
        next_state = vector(7);
    case 12
        next_state = ~(vector(11) || vector(4)) && (vector(10) || vector(12) || vector(9)) && (~vector(5) || vector(9) || vector(12) );
    case 13
        next_state = vector(10) || vector(9) || vector(12);
    case 14
        next_state = 1;
    case 15
        next_state = vector(15);
    case 16
        next_state = vector(15);
    case 17
        next_state = (vector(18) || vector(13));
    case 18
        next_state = vector(17) && ~vector(16) && vector(10);
    case 19
        next_state = vector(18) && ~vector(16);
    case 20
        next_state = ~vector(16) && vector(13) && vector(14);
    case 21
        next_state = vector(16) && ~vector(20);
end

end