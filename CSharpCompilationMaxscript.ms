/*
	-- On the fly C# compilation using maxscript .net
*/

-- Assembly generation param
params = dotnetobject "System.CodeDom.Compiler.CompilerParameters" GenerateExecutable:false

-- << compiler >> generator
codeDomProv = dotnetclass "System.CodeDom.Compiler.CodeDomProvider"

-- << compiler >>
cSharProv   = codeDomProv.CreateProvider("CSharp")

-- << compilation >>
compResults = cSharProv.CompileAssemblyFromSource params #("public class B {public static int k=7;}")

-- here is our assembly!
assembl = compResults.CompiledAssembly

-- Create a B object
bInst = assembl.CreateInstance("B")