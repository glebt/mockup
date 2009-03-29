#!/usr/bin/env ruby
      
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.

require "#{File.dirname(__FILE__)}/../testing_file_support"

describe BalsamiqControlParser do
  it "properly handles titlewindow" do
    data = <<-EOF
            <mockup version="1.0" skin="sketch">
      <controls>
        <control controlID="1" controlTypeID="com.balsamiq.mockups::TitleWindow" x="479" y="57" w="202" h="289" zOrder="0" locked="false" isInGroup="-1">
          <controlProperties>
            <close>true</close>
            <minimize>true</minimize>
            <dragger>true</dragger>
            <topheight>26</topheight>
            <text>A%20Window</text>
            <bottomheight>26</bottomheight>
            <maximizeRestore>true</maximizeRestore>
          </controlProperties>
        </control>
        <control controlID="2" controlTypeID="com.balsamiq.mockups::TitleWindow" x="21" y="7" w="-1" h="-1" zOrder="1" locked="false" isInGroup="-1">
          <controlProperties>
            <text>Window%20Name</text>
            <topheight>26</topheight>
            <bottomheight>25</bottomheight>
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
    <div class="TitleWindow" id="TitleWindow1" 
          style="position: absolute; left: 479px; top: 57px; width: 202px; height: 289px;
          font-size:12pt; ">
      <div style="position: absolute; text-align: left; left: 0px; top: 0px; width:100%; height: 24px">A Window</div>
      <div style="position: absolute; text-align: left; left: 0px; top: 265px; width:100%; height: 24px"></div>
    </div>
    <div class="TitleWindow" id="TitleWindow2" 
          style="position: absolute; left: 21px; top: 7px; width: 450px; height: 400px;
          font-size:12pt; ">
      <div style="position: absolute; text-align: left; left: 0px; top: 0px; width:100%; height: 24px">Window Name</div>
      <div style="position: absolute; text-align: left; left: 0px; top: 377px; width:100%; height: 24px"></div>
    </div>
  </body>
</html>

    EOF
    css = <<-EOF

    EOF
    js = <<-EOF

    EOF
    filename = "titlewindow"
    TestingFileSupport::test_elements(filename, data, html, css, js, false)
  end

end