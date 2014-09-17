library ieee;
use ieee.std_logic_1164.all;
entity logic2 is
    port
    (
        a, b    :in   std_logic_vector(1 downto 0);
        op      :in   std_logic_vector(1 downto 0);
        s       :out  std_logic_vector(1 downto 0)
    );
end logic2;
architecture logic02 of logic2 is
begin
    L0: entity work.Logic1
        port map(a => a(0), b => b(0), op => op(1 downto 0), s => s(0));
    L1: entity work.Logic1
        port map(a => a(1), b => b(1), op => op(1 downto 0), s => s(1));

end logic02;
