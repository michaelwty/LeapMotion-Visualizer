float4x4 W;
float4x4 VP;

struct VertexShaderInput
{
    float4 Position : POSITION0;
	float4 Color : COLOR0;
};

struct VertexShaderOutput
{
    float4 Position : POSITION0;
	float4 Color : COLOR0;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;

    float4 w = mul(input.Position, W);
    output.Position = mul(w, VP);
	output.Color = input.Color;

    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	float4 color = input.Color;
    return color;
}

technique Technique1
{
    pass Pass1
    {
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}
