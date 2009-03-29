#!/usr/bin/env ruby
      
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.

require "#{File.dirname(__FILE__)}/../testing_file_support"

describe BalsamiqControlParser do
  it "properly handles iconlabel" do
    data = <<-EOF
            <mockup version="1.0" skin="sketch">
      <controls>
        <control controlID="8" controlTypeID="com.balsamiq.mockups::IconLabel" x="61" y="22" w="-1" h="-1" zOrder="0" locked="false" isInGroup="-1">
          <controlProperties>
            <text>Icon%20Name</text>
          </controlProperties>
        </control>
        <control controlID="10" controlTypeID="com.balsamiq.mockups::IconLabel" x="193" y="17" w="144" h="-1" zOrder="1" locked="false" isInGroup="-1">
          <controlProperties>
            <text>Another%20icon%21</text>
            <labelPosition>right</labelPosition>
            <color>16711935</color>
          </controlProperties>
        </control>
      </controls>
    </mockup>


    EOF
    html = <<-EOF
    <?xml version="1.0" encoding="UTF-8"?>
<!-- Generated by Balsamiq Exporter -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="reset.css" />
    <title>Balsamiq</title>
    <script type="text/javascript">
    </script>
  </head>

  <body>
      <div class="" id="IconLabel8"
          style="position: absolute; font-size:10pt; left: 61px; top: 22px; 
          width: 48px; height: z-index: 0; outline: none; background-color: transparent">
        <div
            style="position: absolute; font-size:10pt; outline: 2px solid rgba(1,1,1,1.0);
            width: 100%; height: 48px; z-index: 0">
        </div>
        <div
            style="position: absolute; font-size:10pt; left: 0px; top: 48px; text-align: center;
            width: 100%; z-index: 0; outline: none; background-color: transparent">
            Icon Name
        </div>
      </div>
      <div class="" id="IconLabel10"
          style="position: absolute; font-size:10pt; left: 193px; top: 17px; 
          height: 48px; z-index: 1; outline: none; background-color: transparent">
        <div
            style="float:left; font-size:10pt; outline: 2px solid rgba(255,0,255,1.0);
            width: 48px; height: 100%; z-index: 1">
        </div>
        <div
            style="float:left; font-size:10pt; line-height: 48px; margin-left: 5px;
            z-index: 1; outline: none; background-color: transparent; color: rgba(255,0,255,1.0);">
            Another icon!
        </div>
      </div>
  </body>
</html>

    EOF
    css = <<-EOF

    EOF
    js = <<-EOF

    EOF
    filename = "iconlabel"
    TestingFileSupport::test_elements(filename, data, html, css, js, false)
  end

end