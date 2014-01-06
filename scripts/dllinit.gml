global._39dll = argument0;
if(is_real(argument0))global._39dll= "39dll.dll";
//Buffer
global._BufA = external_define(global._39dll, "WriteByte", dll_cdecl, ty_real, 1, ty_real);
global._BufB = external_define(global._39dll, "WriteString", dll_cdecl, ty_real, 2, ty_string, ty_real);
global._BufC = external_define(global._39dll, "WriteShort", dll_cdecl, ty_real, 1, ty_real);
global._BufD = external_define(global._39dll, "WriteInt", dll_cdecl, ty_real, 1, ty_real);
global._BufE = external_define(global._39dll, "WriteFloat", dll_cdecl, ty_real, 1, ty_real);
global._BufF = external_define(global._39dll, "WriteDouble", dll_cdecl, ty_real, 1, ty_real);
global._BufG = external_define(global._39dll, "ReadByte", dll_cdecl, ty_real, 0);
global._BufH = external_define(global._39dll, "ReadString", dll_cdecl, ty_string, 2, ty_real, ty_string);
global._BufI = external_define(global._39dll, "ReadShort", dll_cdecl, ty_real, 0);
global._BufJ = external_define(global._39dll, "ReadInt", dll_cdecl, ty_real, 0);
global._BufK = external_define(global._39dll, "ReadFloat", dll_cdecl, ty_real, 0);
global._BufL = external_define(global._39dll, "ReadDouble", dll_cdecl, ty_real, 0);
global._BufM = external_define(global._39dll, "ClearBuffer", dll_cdecl, ty_real, 0);
global._BufN = external_define(global._39dll, "SetPos", dll_cdecl, ty_real, 1, ty_real);
global._BufO = external_define(global._39dll, "GetPos", dll_cdecl, ty_real, 1, ty_real);
global._BufQ = external_define(global._39dll, "BufferSize", dll_cdecl, ty_real, 0);
global._BufU = external_define(global._39dll, "CreateBuffer", dll_cdecl, ty_real, 0);
global._BufV = external_define(global._39dll, "SetBuffer", dll_cdecl, ty_real, 1, ty_real);
global._BufW = external_define(global._39dll, "ResetBuffer", dll_cdecl, ty_real, 0);
global._BufX = external_define(global._39dll, "DestroyBuffer", dll_cdecl, ty_real, 1, ty_real);
global._BufY = external_define(global._39dll, "WriteuShort", dll_cdecl, ty_real, 1, ty_real);
global._BufZ = external_define(global._39dll, "WriteuInt", dll_cdecl, ty_real, 1, ty_real);
global._BufAA = external_define(global._39dll, "ReaduShort", dll_cdecl, ty_real, 0);
global._BufAB = external_define(global._39dll, "ReaduInt", dll_cdecl, ty_real, 0);
if(argument1)
{
//Sockets
global._SokA = external_define(global._39dll, "TcpConnect", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real);
global._SokB = external_define(global._39dll, "TcpListen", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
global._SokC = external_define(global._39dll, "TcpAccept", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._SokD = external_define(global._39dll, "MessageSend", dll_cdecl, ty_real, 3, ty_real, ty_string, ty_real);
global._SokE = external_define(global._39dll, "MessageRecieve", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._SokF = external_define(global._39dll, "setSync", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._SokG = external_define(global._39dll, "SetFormat", dll_cdecl, ty_real, 2, ty_real, ty_string);
global._SokH = external_define(global._39dll, "UdpConnect", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._SokI = external_define(global._39dll, "GetIp", dll_cdecl, ty_string, 1, ty_string);
global._SokJ = external_define(global._39dll, "LastUdpIp", dll_cdecl, ty_string, 0);
global._SokK = external_define(global._39dll, "SockClose", dll_cdecl, ty_real, 1, ty_real);
global._SokL = external_define(global._39dll, "TcpAddress", dll_cdecl, ty_string, 1, ty_real);
global._SokM = external_define(global._39dll, "LastError", dll_cdecl, ty_real, 0);
global._SokN = external_define(global._39dll, "MyHost", dll_cdecl, ty_string, 0);
global._SokO = external_define(global._39dll, "IpCompare", dll_cdecl, ty_real, 2, ty_string, ty_string);
global._SokP = external_define(global._39dll, "SockExit", dll_cdecl, ty_real, 0);
global._SokQ = external_define(global._39dll, "SockStart", dll_cdecl, ty_real, 0);
global._SokR = external_define(global._39dll, "GetMACAddress", dll_cdecl, ty_string, 0);
global._SokS = external_define(global._39dll, "MessagePeek", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._SokT = external_define(global._39dll, "SetNagleAlgorithm", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._SokU = external_define(global._39dll, "IsSockConnected", dll_cdecl, ty_real, 1, ty_real);
global._SokV = external_define(global._39dll, "SetRawOption", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
global._SokW = external_define(global._39dll, "GetRawOption", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
}
if(argument2)
{
//File functions
global._FilA = external_define(global._39dll, "BinOpen", dll_cdecl, ty_real, 2, ty_string, ty_real);
global._FilB = external_define(global._39dll, "BinClose", dll_cdecl, ty_real, 1, ty_real);
global._FilC = external_define(global._39dll, "BinWrite", dll_cdecl, ty_real, 1, ty_real);
global._FilD = external_define(global._39dll, "BinRead", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._FilE = external_define(global._39dll, "BinGetPos", dll_cdecl, ty_real, 1, ty_real);
global._FilF = external_define(global._39dll, "BinSetPos", dll_cdecl, ty_real, 2, ty_real, ty_real);
global._FilG = external_define(global._39dll, "BinFileSize", dll_cdecl, ty_real, 1, ty_real);
global._UtilA = external_define(global._39dll, "MD5String", dll_cdecl, ty_string, 1, ty_string);
global._UtilB = external_define(global._39dll, "MD5Buffer", dll_cdecl, ty_string, 0);
global._UtilC = external_define(global._39dll, "bufferchecksum", dll_cdecl, ty_real, 0);
global._UtilD = external_define(global._39dll, "StreamEncrypt", dll_cdecl, ty_real, 1, ty_string);
global._UtilE = external_define(global._39dll, "IptoUInt", dll_cdecl, ty_real, 1, ty_string);
global._UtilF = external_define(global._39dll, "UInttoIP", dll_cdecl, ty_string, 1, ty_real);
global._UtilG = external_define(global._39dll, "netconnected", dll_cdecl, ty_real, 0);
}
