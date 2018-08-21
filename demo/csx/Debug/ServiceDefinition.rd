<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="demo" generation="1" functional="0" release="0" Id="3fbf1081-72de-4e25-9eb2-e9ce156a15b8" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="demoGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WCFServiceWebRoledemo:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/demo/demoGroup/LB:WCFServiceWebRoledemo:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="WCFServiceWebRoledemo:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/demo/demoGroup/MapWCFServiceWebRoledemo:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="WCFServiceWebRoledemoInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/demo/demoGroup/MapWCFServiceWebRoledemoInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WCFServiceWebRoledemo:Endpoint1">
          <toPorts>
            <inPortMoniker name="/demo/demoGroup/WCFServiceWebRoledemo/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapWCFServiceWebRoledemo:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/demo/demoGroup/WCFServiceWebRoledemo/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapWCFServiceWebRoledemoInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/demo/demoGroup/WCFServiceWebRoledemoInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WCFServiceWebRoledemo" generation="1" functional="0" release="0" software="C:\Users\tuant\source\repos\demo\demo\csx\Debug\roles\WCFServiceWebRoledemo" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WCFServiceWebRoledemo&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WCFServiceWebRoledemo&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/demo/demoGroup/WCFServiceWebRoledemoInstances" />
            <sCSPolicyUpdateDomainMoniker name="/demo/demoGroup/WCFServiceWebRoledemoUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/demo/demoGroup/WCFServiceWebRoledemoFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WCFServiceWebRoledemoUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WCFServiceWebRoledemoFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WCFServiceWebRoledemoInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="c715fb17-b157-42d2-9170-461d227039ee" ref="Microsoft.RedDog.Contract\ServiceContract\demoContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="af946794-1eb5-435c-b9b9-9e4d42a35292" ref="Microsoft.RedDog.Contract\Interface\WCFServiceWebRoledemo:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/demo/demoGroup/WCFServiceWebRoledemo:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>