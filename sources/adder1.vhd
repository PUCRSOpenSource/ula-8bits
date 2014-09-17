library ieee;
use ieee.std_logic_1164.all;
entity adder1 is
    port
    (
        cin     :in  std_logic;
        a, b    :in  std_logic;

        cout    :out std_logic;
        s       :out std_logic
    );
end adder1;
architecture adder01 of adder1 is
begin
    s     <= a xor b xor cin;
    cout  <= (a and b) or (cin and a) or (cin and b);
end adder01;,w
