module abie;

import std.stdio;
import godwit.abi;
import std.conv;
import core.simd;

int main()
{
    ulong[] a = [18];
    float f = 2;
    {
        //mixin(mov!(rcx, a));
        mixin(mov!(xmm0, f, float4));
    }
    asm { call test; }
    writeln(f); // [18]
    readln();
    return 0;
}

void test(int a)
{
    writeln(a); // [19]
}
