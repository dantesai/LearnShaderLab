Shader "LearnOfficialShader/Normal-Bumped Diffuse" {
Properties {
	_Color ("Main Color", Color) = (1, 1, 1, 1)
	_MainTex ("Base (RGB)",2D ) = "white"{}
	_BumpMap ("Normalmap",2D ) = "bump"{}
}


SubShader {
	Tags { "TenderType" = "Opaque" }
	LOD 300

CGPROGRAM
#pragma surface surf Lambert

sampler2D  _MainTex;
sampler2D  _BumpMap;
fixed _Color;

struct Input{
	float2 uv_MainTex;
	float2 uv_BumpMap;	
};

void surf (Input In,inout SurfaceOutput o) {
	fixed3 c = tex2D(_MainTex,In.uv_MainTex)*_Color;
	o.Albedo = c.rgb;
	//o.Alpha = c.a;
	o.Normal = UnpackNormal(tex2D(_BumpMap,In.uv_BumpMap));
	
}
ENDCG
}

FallBack"legacy Shader/Diffuse"
}