library ieee;
use ieee.std_logic_1164.all;
entity logic1 is
    port
    (
        a, b    :in   std_logic;
        op      :in   std_logic_vector(2 downto 0);
        s       :out std_logic
    );
end logic1;
architecture logic01 of logic1 is
    signal output: std_logic;
begin
    with op select
        output  <= a  and b when  "111" --AND
                   a  xor b when  "110" --XOR
                   a  or  b when  "101" --OR
                   not a    when  others;

    s <= output;

end logic01;
