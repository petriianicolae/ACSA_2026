<?xml version="1.1" encoding="UTF-8"?>
<sysml:SysMLContainerPackage xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sysml="http://www.ikv.de/medini/sysml/1.0" xmi:id="_utvnYLXDEfGIG6kl4PRZLQ" mediniIdentifier="_utvnYLXDEfGIG6kl4PRZLQ" name="Warning System">
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_fjGWALZvEfG51-STqqQBiw" mediniIdentifier="_fjGWALZvEfG51-STqqQBiw" typeCode="Cameras" name="Mono + Stereo" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_1DUO0LZyEfG51-STqqQBiw" mediniIdentifier="_1DUO0LZyEfG51-STqqQBiw" name="image_out" the_relationship_of_source="_4frWELZ0EfG51-STqqQBiw _913-sLZ0EfG51-STqqQBiw" the_relationship_of_target="_4frWELZ0EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_4frWELZ0EfG51-STqqQBiw" mediniIdentifier="_4frWELZ0EfG51-STqqQBiw" the_source_element="_1DUO0LZyEfG51-STqqQBiw" the_target_element="_1DUO0LZyEfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_4frWErZ0EfG51-STqqQBiw" mediniIdentifier="_4frWErZ0EfG51-STqqQBiw" role="_1DUO0LZyEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_4frWE7Z0EfG51-STqqQBiw" mediniIdentifier="_4frWE7Z0EfG51-STqqQBiw" role="_1DUO0LZyEfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_913-sLZ0EfG51-STqqQBiw" mediniIdentifier="_913-sLZ0EfG51-STqqQBiw" asset="true" the_source_element="_1DUO0LZyEfG51-STqqQBiw" the_target_element="_6bDvkLZyEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_914lwLZ0EfG51-STqqQBiw" mediniIdentifier="_914lwLZ0EfG51-STqqQBiw" role="_1DUO0LZyEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_914lwbZ0EfG51-STqqQBiw" mediniIdentifier="_914lwbZ0EfG51-STqqQBiw" role="_6bDvkLZyEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_gSHYILZvEfG51-STqqQBiw" mediniIdentifier="_gSHYILZvEfG51-STqqQBiw" typeCode="Edge_Detector" name="YOLOv5 fast path" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_6bDvkLZyEfG51-STqqQBiw" mediniIdentifier="_6bDvkLZyEfG51-STqqQBiw" name="image_in" the_relationship_of_target="_913-sLZ0EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_94uJQLZyEfG51-STqqQBiw" mediniIdentifier="_94uJQLZyEfG51-STqqQBiw" name="detections_out" the_relationship_of_source="_G1oH8LZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_G1oH8LZ1EfG51-STqqQBiw" mediniIdentifier="_G1oH8LZ1EfG51-STqqQBiw" asset="true" the_source_element="_94uJQLZyEfG51-STqqQBiw" the_target_element="_DilUwLZzEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_G1ovALZ1EfG51-STqqQBiw" mediniIdentifier="_G1ovALZ1EfG51-STqqQBiw" role="_94uJQLZyEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_G1ovAbZ1EfG51-STqqQBiw" mediniIdentifier="_G1ovAbZ1EfG51-STqqQBiw" role="_DilUwLZzEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_gvhF0LZvEfG51-STqqQBiw" mediniIdentifier="_gvhF0LZvEfG51-STqqQBiw" typeCode="Situation_Detection" name="Agent 1, MLLM call" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_DilUwLZzEfG51-STqqQBiw" mediniIdentifier="_DilUwLZzEfG51-STqqQBiw" name="detections_in" the_relationship_of_target="_G1oH8LZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_NOtb0LZzEfG51-STqqQBiw" mediniIdentifier="_NOtb0LZzEfG51-STqqQBiw" name="hazard_out" the_relationship_of_source="_KUvTILZ1EfG51-STqqQBiw _L2_wELZ1EfG51-STqqQBiw" the_relationship_of_target="_KUvTILZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_WqocULZ2EfG51-STqqQBiw" mediniIdentifier="_WqocULZ2EfG51-STqqQBiw" name="mllm_request" the_relationship_of_source="_9Yw6ALZ2EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_aN6B4LaOEfG51-STqqQBiw" mediniIdentifier="_aN6B4LaOEfG51-STqqQBiw" name="uu_mllm_link" the_relationship_of_source="_dvVhQLaOEfG51-STqqQBiw _hQWw8LaOEfG51-STqqQBiw _xi3WILaOEfG51-STqqQBiw" the_relationship_of_target="_dvVhQLaOEfG51-STqqQBiw" asset="true" direction="inout">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_KUvTILZ1EfG51-STqqQBiw" mediniIdentifier="_KUvTILZ1EfG51-STqqQBiw" the_source_element="_NOtb0LZzEfG51-STqqQBiw" the_target_element="_NOtb0LZzEfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_KUv6MLZ1EfG51-STqqQBiw" mediniIdentifier="_KUv6MLZ1EfG51-STqqQBiw" role="_NOtb0LZzEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_KUv6MbZ1EfG51-STqqQBiw" mediniIdentifier="_KUv6MbZ1EfG51-STqqQBiw" role="_NOtb0LZzEfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_L2_wELZ1EfG51-STqqQBiw" mediniIdentifier="_L2_wELZ1EfG51-STqqQBiw" asset="true" the_source_element="_NOtb0LZzEfG51-STqqQBiw" the_target_element="_RsMTwLZzEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_L3AXILZ1EfG51-STqqQBiw" mediniIdentifier="_L3AXILZ1EfG51-STqqQBiw" role="_NOtb0LZzEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_L3AXIbZ1EfG51-STqqQBiw" mediniIdentifier="_L3AXIbZ1EfG51-STqqQBiw" role="_RsMTwLZzEfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_9Yw6ALZ2EfG51-STqqQBiw" mediniIdentifier="_9Yw6ALZ2EfG51-STqqQBiw" asset="true" the_source_element="_WqocULZ2EfG51-STqqQBiw" the_target_element="_jMmIELZ2EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_9YxhELZ2EfG51-STqqQBiw" mediniIdentifier="_9YxhELZ2EfG51-STqqQBiw" role="_WqocULZ2EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_9YyIILZ2EfG51-STqqQBiw" mediniIdentifier="_9YyIILZ2EfG51-STqqQBiw" role="_jMmIELZ2EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_dvVhQLaOEfG51-STqqQBiw" mediniIdentifier="_dvVhQLaOEfG51-STqqQBiw" the_source_element="_aN6B4LaOEfG51-STqqQBiw" the_target_element="_aN6B4LaOEfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_dvWIULaOEfG51-STqqQBiw" mediniIdentifier="_dvWIULaOEfG51-STqqQBiw" role="_aN6B4LaOEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_dvWIUbaOEfG51-STqqQBiw" mediniIdentifier="_dvWIUbaOEfG51-STqqQBiw" role="_aN6B4LaOEfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_hQWw8LaOEfG51-STqqQBiw" mediniIdentifier="_hQWw8LaOEfG51-STqqQBiw" the_source_element="_aN6B4LaOEfG51-STqqQBiw" the_target_element="_jMmIELZ2EfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_hQXYAbaOEfG51-STqqQBiw" mediniIdentifier="_hQXYAbaOEfG51-STqqQBiw" role="_aN6B4LaOEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_hQXYAraOEfG51-STqqQBiw" mediniIdentifier="_hQXYAraOEfG51-STqqQBiw" role="_jMmIELZ2EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_xi3WILaOEfG51-STqqQBiw" mediniIdentifier="_xi3WILaOEfG51-STqqQBiw" asset="true" the_source_element="_aN6B4LaOEfG51-STqqQBiw" the_target_element="_t0iDMLaOEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_xi39MLaOEfG51-STqqQBiw" mediniIdentifier="_xi39MLaOEfG51-STqqQBiw" role="_aN6B4LaOEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_xi39MbaOEfG51-STqqQBiw" mediniIdentifier="_xi39MbaOEfG51-STqqQBiw" role="_t0iDMLaOEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_hKjcALZvEfG51-STqqQBiw" mediniIdentifier="_hKjcALZvEfG51-STqqQBiw" typeCode="Distance_Estimate" name="Agent 2, Depth Pro" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_RsMTwLZzEfG51-STqqQBiw" mediniIdentifier="_RsMTwLZzEfG51-STqqQBiw" name="hazard_in" the_relationship_of_target="_L2_wELZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_YA6aILZzEfG51-STqqQBiw" mediniIdentifier="_YA6aILZzEfG51-STqqQBiw" name="distance_out" the_relationship_of_source="_OE1goLZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_OE1goLZ1EfG51-STqqQBiw" mediniIdentifier="_OE1goLZ1EfG51-STqqQBiw" asset="true" the_source_element="_YA6aILZzEfG51-STqqQBiw" the_target_element="_c_9HALZzEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_OE2HsLZ1EfG51-STqqQBiw" mediniIdentifier="_OE2HsLZ1EfG51-STqqQBiw" role="_YA6aILZzEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_OE2HsbZ1EfG51-STqqQBiw" mediniIdentifier="_OE2HsbZ1EfG51-STqqQBiw" role="_c_9HALZzEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_hmMPILZvEfG51-STqqQBiw" mediniIdentifier="_hmMPILZvEfG51-STqqQBiw" typeCode="Message_Generation" name="Agent 3, MLLM call" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_c_9HALZzEfG51-STqqQBiw" mediniIdentifier="_c_9HALZzEfG51-STqqQBiw" name="distance_in" the_relationship_of_target="_OE1goLZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_k01YkLZzEfG51-STqqQBiw" mediniIdentifier="_k01YkLZzEfG51-STqqQBiw" name="content_out" the_relationship_of_source="_PnYRcLZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_evr34LZ2EfG51-STqqQBiw" mediniIdentifier="_evr34LZ2EfG51-STqqQBiw" name="mllm_request" the_relationship_of_source="_FSGNwLZ3EfG51-STqqQBiw _r5aRwLZ3EfG51-STqqQBiw _thd0sLZ3EfG51-STqqQBiw" the_relationship_of_target="_FSGNwLZ3EfG51-STqqQBiw _r5aRwLZ3EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_8rTqMLaOEfG51-STqqQBiw" mediniIdentifier="_8rTqMLaOEfG51-STqqQBiw" name="uu_mllm_link" the_relationship_of_source="_aclPsLaREfG51-STqqQBiw" asset="true" direction="inout">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_PnYRcLZ1EfG51-STqqQBiw" mediniIdentifier="_PnYRcLZ1EfG51-STqqQBiw" asset="true" the_source_element="_k01YkLZzEfG51-STqqQBiw" the_target_element="_p-OUQLZzEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_PnZfkLZ1EfG51-STqqQBiw" mediniIdentifier="_PnZfkLZ1EfG51-STqqQBiw" role="_k01YkLZzEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_PnaGoLZ1EfG51-STqqQBiw" mediniIdentifier="_PnaGoLZ1EfG51-STqqQBiw" role="_p-OUQLZzEfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_FSGNwLZ3EfG51-STqqQBiw" mediniIdentifier="_FSGNwLZ3EfG51-STqqQBiw" the_source_element="_evr34LZ2EfG51-STqqQBiw" the_target_element="_evr34LZ2EfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_FSGNwrZ3EfG51-STqqQBiw" mediniIdentifier="_FSGNwrZ3EfG51-STqqQBiw" role="_evr34LZ2EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_FSG00LZ3EfG51-STqqQBiw" mediniIdentifier="_FSG00LZ3EfG51-STqqQBiw" role="_evr34LZ2EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_r5aRwLZ3EfG51-STqqQBiw" mediniIdentifier="_r5aRwLZ3EfG51-STqqQBiw" the_source_element="_evr34LZ2EfG51-STqqQBiw" the_target_element="_evr34LZ2EfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_r5aRwrZ3EfG51-STqqQBiw" mediniIdentifier="_r5aRwrZ3EfG51-STqqQBiw" role="_evr34LZ2EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_r5a40LZ3EfG51-STqqQBiw" mediniIdentifier="_r5a40LZ3EfG51-STqqQBiw" role="_evr34LZ2EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_thd0sLZ3EfG51-STqqQBiw" mediniIdentifier="_thd0sLZ3EfG51-STqqQBiw" asset="true" the_source_element="_evr34LZ2EfG51-STqqQBiw" the_target_element="_k1KL4LZ3EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_thebwLZ3EfG51-STqqQBiw" mediniIdentifier="_thebwLZ3EfG51-STqqQBiw" role="_evr34LZ2EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_thebwbZ3EfG51-STqqQBiw" mediniIdentifier="_thebwbZ3EfG51-STqqQBiw" role="_k1KL4LZ3EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_aclPsLaREfG51-STqqQBiw" mediniIdentifier="_aclPsLaREfG51-STqqQBiw" asset="true" the_source_element="_8rTqMLaOEfG51-STqqQBiw" the_target_element="_BsqrQLaPEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_acl2wLaREfG51-STqqQBiw" mediniIdentifier="_acl2wLaREfG51-STqqQBiw" role="_8rTqMLaOEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_acl2wbaREfG51-STqqQBiw" mediniIdentifier="_acl2wbaREfG51-STqqQBiw" role="_BsqrQLaPEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_LSPPcLZwEfG51-STqqQBiw" mediniIdentifier="_LSPPcLZwEfG51-STqqQBiw" typeCode="DENM_Encoder" name="ASN.1 UPER payload" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_p-OUQLZzEfG51-STqqQBiw" mediniIdentifier="_p-OUQLZzEfG51-STqqQBiw" name="content_in" the_relationship_of_target="_PnYRcLZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_vhqHoLZzEfG51-STqqQBiw" mediniIdentifier="_vhqHoLZzEfG51-STqqQBiw" name="denm_out" the_relationship_of_source="_SzIbwLZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_SzIbwLZ1EfG51-STqqQBiw" mediniIdentifier="_SzIbwLZ1EfG51-STqqQBiw" asset="true" the_source_element="_vhqHoLZzEfG51-STqqQBiw" the_target_element="_z_K0wLZzEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_SzJC0LZ1EfG51-STqqQBiw" mediniIdentifier="_SzJC0LZ1EfG51-STqqQBiw" role="_vhqHoLZzEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_SzJC0bZ1EfG51-STqqQBiw" mediniIdentifier="_SzJC0bZ1EfG51-STqqQBiw" role="_z_K0wLZzEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_L8-1kLZwEfG51-STqqQBiw" mediniIdentifier="_L8-1kLZwEfG51-STqqQBiw" typeCode="RSU" name="Signs, PC5, HSM" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_z_K0wLZzEfG51-STqqQBiw" mediniIdentifier="_z_K0wLZzEfG51-STqqQBiw" name="denm_in" the_relationship_of_target="_SzIbwLZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_64fdALZzEfG51-STqqQBiw" mediniIdentifier="_64fdALZzEfG51-STqqQBiw" name="pc5_out" the_relationship_of_source="_VK3IILZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_nRb2gLZ2EfG51-STqqQBiw" mediniIdentifier="_nRb2gLZ2EfG51-STqqQBiw" name="uu_uplink" the_relationship_of_source="_KAezALZ4EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_QmKHsLaSEfG51-STqqQBiw" mediniIdentifier="_QmKHsLaSEfG51-STqqQBiw" name="uu_link" the_relationship_of_source="_XwoxYLaSEfG51-STqqQBiw" asset="true" direction="inout">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_VK3IILZ1EfG51-STqqQBiw" mediniIdentifier="_VK3IILZ1EfG51-STqqQBiw" asset="true" the_source_element="_64fdALZzEfG51-STqqQBiw" the_target_element="_JXNwYLZ0EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_VK4WQLZ1EfG51-STqqQBiw" mediniIdentifier="_VK4WQLZ1EfG51-STqqQBiw" role="_64fdALZzEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_VK4WQbZ1EfG51-STqqQBiw" mediniIdentifier="_VK4WQbZ1EfG51-STqqQBiw" role="_JXNwYLZ0EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_KAezALZ4EfG51-STqqQBiw" mediniIdentifier="_KAezALZ4EfG51-STqqQBiw" asset="true" the_source_element="_nRb2gLZ2EfG51-STqqQBiw" the_target_element="_uHDDcLZ2EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_KAgBILZ4EfG51-STqqQBiw" mediniIdentifier="_KAgBILZ4EfG51-STqqQBiw" role="_nRb2gLZ2EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_KAgBIbZ4EfG51-STqqQBiw" mediniIdentifier="_KAgBIbZ4EfG51-STqqQBiw" role="_uHDDcLZ2EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_XwoxYLaSEfG51-STqqQBiw" mediniIdentifier="_XwoxYLaSEfG51-STqqQBiw" asset="true" the_source_element="_QmKHsLaSEfG51-STqqQBiw" the_target_element="_SLmbgLaSEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_XwpYcLaSEfG51-STqqQBiw" mediniIdentifier="_XwpYcLaSEfG51-STqqQBiw" role="_QmKHsLaSEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_XwpYcbaSEfG51-STqqQBiw" mediniIdentifier="_XwpYcbaSEfG51-STqqQBiw" role="_SLmbgLaSEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_MZOFoLZwEfG51-STqqQBiw" mediniIdentifier="_MZOFoLZwEfG51-STqqQBiw" typeCode="OBU" name="PC5 + Uumodem" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_EhFu8LZ0EfG51-STqqQBiw" mediniIdentifier="_EhFu8LZ0EfG51-STqqQBiw" direction="in"/>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_JXNwYLZ0EfG51-STqqQBiw" mediniIdentifier="_JXNwYLZ0EfG51-STqqQBiw" name="pc5_in" the_relationship_of_target="_VK3IILZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_N5lIULZ0EfG51-STqqQBiw" mediniIdentifier="_N5lIULZ0EfG51-STqqQBiw" name="warning_out" the_relationship_of_source="_XdnN4LZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_qsb9wLZ2EfG51-STqqQBiw" mediniIdentifier="_qsb9wLZ2EfG51-STqqQBiw" name="uu_modem" the_relationship_of_source="_Ny24cLZ4EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_Ai9UYLaTEfG51-STqqQBiw" mediniIdentifier="_Ai9UYLaTEfG51-STqqQBiw" name="uu_modem" the_relationship_of_target="_JoWLkLaTEfG51-STqqQBiw _cdDnwLaTEfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_XdnN4LZ1EfG51-STqqQBiw" mediniIdentifier="_XdnN4LZ1EfG51-STqqQBiw" asset="true" the_source_element="_N5lIULZ0EfG51-STqqQBiw" the_target_element="_UK7KkLZ0EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_XdnN4rZ1EfG51-STqqQBiw" mediniIdentifier="_XdnN4rZ1EfG51-STqqQBiw" role="_N5lIULZ0EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_XdnN47Z1EfG51-STqqQBiw" mediniIdentifier="_XdnN47Z1EfG51-STqqQBiw" role="_UK7KkLZ0EfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_Ny24cLZ4EfG51-STqqQBiw" mediniIdentifier="_Ny24cLZ4EfG51-STqqQBiw" asset="true" the_source_element="_qsb9wLZ2EfG51-STqqQBiw" the_target_element="_9px8ELZ3EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_Ny3fgLZ4EfG51-STqqQBiw" mediniIdentifier="_Ny3fgLZ4EfG51-STqqQBiw" role="_qsb9wLZ2EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_Ny3fgbZ4EfG51-STqqQBiw" mediniIdentifier="_Ny3fgbZ4EfG51-STqqQBiw" role="_9px8ELZ3EfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_M0fFULZwEfG51-STqqQBiw" mediniIdentifier="_M0fFULZwEfG51-STqqQBiw" typeCode="Vehicle_Computer" name="Verify, warning logic" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_UK7KkLZ0EfG51-STqqQBiw" mediniIdentifier="_UK7KkLZ0EfG51-STqqQBiw" name="warning_in" the_relationship_of_target="_XdnN4LZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_Z02ngLZ0EfG51-STqqQBiw" mediniIdentifier="_Z02ngLZ0EfG51-STqqQBiw" name="alert_out" the_relationship_of_source="_hVAw0LZ1EfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_hVAw0LZ1EfG51-STqqQBiw" mediniIdentifier="_hVAw0LZ1EfG51-STqqQBiw" asset="true" the_source_element="_Z02ngLZ0EfG51-STqqQBiw" the_target_element="_eUy9kLZ0EfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_hVBX4LZ1EfG51-STqqQBiw" mediniIdentifier="_hVBX4LZ1EfG51-STqqQBiw" role="_Z02ngLZ0EfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_hVBX4bZ1EfG51-STqqQBiw" mediniIdentifier="_hVBX4bZ1EfG51-STqqQBiw" role="_eUy9kLZ0EfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_NyoIkLZwEfG51-STqqQBiw" mediniIdentifier="_NyoIkLZwEfG51-STqqQBiw" typeCode="Driver_HMI" name="Visual + audio alert" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_eUy9kLZ0EfG51-STqqQBiw" mediniIdentifier="_eUy9kLZ0EfG51-STqqQBiw" name="alert_in" the_relationship_of_target="_hVAw0LZ1EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_ONQ2ILZwEfG51-STqqQBiw" mediniIdentifier="_ONQ2ILZwEfG51-STqqQBiw" typeCode="Cloud_MLLM" name="Gemini API" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_jMmIELZ2EfG51-STqqQBiw" mediniIdentifier="_jMmIELZ2EfG51-STqqQBiw" name="mllm_in" the_relationship_of_target="_9Yw6ALZ2EfG51-STqqQBiw _hQWw8LaOEfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_k1KL4LZ3EfG51-STqqQBiw" mediniIdentifier="_k1KL4LZ3EfG51-STqqQBiw" name="mllm_in_2" the_relationship_of_target="_thd0sLZ3EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_pwSxsLaOEfG51-STqqQBiw" mediniIdentifier="_pwSxsLaOEfG51-STqqQBiw" direction="inout"/>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_t0iDMLaOEfG51-STqqQBiw" mediniIdentifier="_t0iDMLaOEfG51-STqqQBiw" name="mllm_link_1" the_relationship_of_target="_xi3WILaOEfG51-STqqQBiw" asset="true" direction="inout">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_BsqrQLaPEfG51-STqqQBiw" mediniIdentifier="_BsqrQLaPEfG51-STqqQBiw" name="mllm_link_2" the_relationship_of_target="_aclPsLaREfG51-STqqQBiw" asset="true" direction="inout">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_OoD7wLZwEfG51-STqqQBiw" mediniIdentifier="_OoD7wLZwEfG51-STqqQBiw" typeCode="Central_ITS_S" name="PKI, operator" asset="true">
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_uHDDcLZ2EfG51-STqqQBiw" mediniIdentifier="_uHDDcLZ2EfG51-STqqQBiw" name="uu_in" the_relationship_of_target="_KAezALZ4EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_0rAqQLZ3EfG51-STqqQBiw" mediniIdentifier="_0rAqQLZ3EfG51-STqqQBiw" direction="in"/>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_9px8ELZ3EfG51-STqqQBiw" mediniIdentifier="_9px8ELZ3EfG51-STqqQBiw" name="uu_in_2" the_relationship_of_target="_Ny24cLZ4EfG51-STqqQBiw" asset="true" direction="in">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_SLmbgLaSEfG51-STqqQBiw" mediniIdentifier="_SLmbgLaSEfG51-STqqQBiw" name="uu_link_rsu" the_relationship_of_target="_XwoxYLaSEfG51-STqqQBiw" asset="true" direction="inout">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="__XN6ALaSEfG51-STqqQBiw" mediniIdentifier="__XN6ALaSEfG51-STqqQBiw" the_relationship_of_source="_JoWLkLaTEfG51-STqqQBiw" direction="out"/>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_W10ScLaTEfG51-STqqQBiw" mediniIdentifier="_W10ScLaTEfG51-STqqQBiw" direction="out"/>
    <the_owned_elements xsi:type="sysml:SysMLPortUsage" xmi:id="_Y-JQ4LaTEfG51-STqqQBiw" mediniIdentifier="_Y-JQ4LaTEfG51-STqqQBiw" name="uu_modem_out" the_relationship_of_source="_cdDnwLaTEfG51-STqqQBiw" asset="true" direction="out">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    </the_owned_elements>
    <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
    <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_sNvNcM8CEemOvMGPpWSWoA"/>
    <securityAttributes href="../commons/settings.cybersec#_KnpbsNYVEemme5in8-9nig"/>
    <securityAttributes href="../commons/settings.cybersec#_MdwBsNYVEemme5in8-9nig"/>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_JoWLkLaTEfG51-STqqQBiw" mediniIdentifier="_JoWLkLaTEfG51-STqqQBiw" the_source_element="__XN6ALaSEfG51-STqqQBiw" the_target_element="_Ai9UYLaTEfG51-STqqQBiw">
      <theConnectorEnd xmi:id="_JoWLkraTEfG51-STqqQBiw" mediniIdentifier="_JoWLkraTEfG51-STqqQBiw" role="__XN6ALaSEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_JoWLk7aTEfG51-STqqQBiw" mediniIdentifier="_JoWLk7aTEfG51-STqqQBiw" role="_Ai9UYLaTEfG51-STqqQBiw"/>
    </connectors>
    <connectors xsi:type="sysml:SysMLConnector" xmi:id="_cdDnwLaTEfG51-STqqQBiw" mediniIdentifier="_cdDnwLaTEfG51-STqqQBiw" asset="true" the_source_element="_Y-JQ4LaTEfG51-STqqQBiw" the_target_element="_Ai9UYLaTEfG51-STqqQBiw">
      <securityAttributes href="../commons/settings.cybersec#_VLY3sM74EemH8PpOxVZSBg"/>
      <securityAttributes href="../commons/settings.cybersec#_l4NOwM8CEemOvMGPpWSWoA"/>
      <securityAttributes href="../commons/settings.cybersec#_l8D0AM8CEemOvMGPpWSWoA"/>
      <theConnectorEnd xmi:id="_cdEO0LaTEfG51-STqqQBiw" mediniIdentifier="_cdEO0LaTEfG51-STqqQBiw" role="_Y-JQ4LaTEfG51-STqqQBiw"/>
      <theConnectorEnd xmi:id="_cdEO0baTEfG51-STqqQBiw" mediniIdentifier="_cdEO0baTEfG51-STqqQBiw" role="_Ai9UYLaTEfG51-STqqQBiw"/>
    </connectors>
  </the_owned_elements>
  <the_owned_elements xsi:type="sysml:SysMLPart" xmi:id="_42OnULaUEfG51-STqqQBiw" mediniIdentifier="_42OnULaUEfG51-STqqQBiw" typeCode="5G Connection" name="Connectivity"/>
</sysml:SysMLContainerPackage>
