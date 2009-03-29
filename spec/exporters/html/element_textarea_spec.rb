#!/usr/bin/env ruby
      
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.

require "#{File.dirname(__FILE__)}/../testing_file_support"

describe BalsamiqControlParser do
  it "properly handles textarea" do
    data = <<-EOF
            <mockup version="1.0" skin="sketch">
      <controls>
        <control controlID="40" controlTypeID="com.balsamiq.mockups::TextArea" x="280" y="16" w="126" h="244" zOrder="1" locked="false" isInGroup="-1">
          <controlProperties>
            <text>Some%20text%0AA%20second%20line%20of%20text%0AA%20third%20line%20of%20text%20that%20is%20extra%20long</text>
            <backgroundAlpha>0.25</backgroundAlpha>
            <color>32832</color>
          </controlProperties>
        </control>
        <control controlID="39" controlTypeID="com.balsamiq.mockups::TextArea" x="30" y="10" w="-1" h="-1" zOrder="0" locked="false" isInGroup="-1">
          <controlProperties>
            <text>Some%20text%0AA%20second%20line%20of%20text</text>
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
        <div class="TextArea" id="TextArea40"
            style="position: absolute; left: 280px; top: 16px; width: 126px; height: 244px;
            z-index: 1; outline: none; background-color: transparent;">
          <div class="TextArea"
              style="position: absolute; left:1px; top:1px; width: 128px; height: 246px;
                z-index: 1; outline: none; background-color: rgba(0,128,64,1.0); opacity: 0.25";>
          </div>
          <div class="TextArea"
              style="position: absolute; left: 0px; top: 0px; width: 126px; height: 244px;
                z-index: 1; border: 2px solid #010101; outline: none; background-color: transparent";>
          </div>
          <div style="position: absolute; font-size: 13px; text-align: left; margin: 4px;
            z-index: 2; outline: none; background-color: transparent;">
            <p>Some text</p>
    <p>A second line of text</p>
    <p>A third line of text that is extra long</p>
          </div>
        </div>
        <div class="TextArea" id="TextArea39"
            style="position: absolute; left: 30px; top: 10px; width: 200px; height: 140px;
            z-index: 0; outline: none; background-color: transparent;">
          <div class="TextArea"
              style="position: absolute; left:1px; top:1px; width: 202px; height: 142px;
                z-index: 0; outline: none; background-color: RGBA(255,255,255,1.0); opacity: 1.0";>
          </div>
          <div class="TextArea"
              style="position: absolute; left: 0px; top: 0px; width: 200px; height: 140px;
                z-index: 0; border: 2px solid #010101; outline: none; background-color: transparent";>
          </div>
          <div style="position: absolute; font-size: 13px; text-align: left; margin: 4px;
            z-index: 1; outline: none; background-color: transparent;">
            <p>Some text</p>
    <p>A second line of text</p>
          </div>
        </div>
      </body>
    </html>
    EOF
    css = <<-EOF
    /* Generated by Balsamiq Exporter */
* {
  vertical-align: baseline;
  font-weight: inherit;
  font-family: inherit;
  font-style: inherit;
  font-size: 100%;
  border: 0 none;
  outline: 0;
  padding: 0;
  margin: 0;
}

body {
  background-color: #f8f4ed;
  font-family: "Comic Sans MS", Arial,sans-serif;
  color: #010101;
}

div {
  background-color: #ffffff;
  outline: 2px solid #202028;
  text-align: center;
}

a {
  color:#0101ff;
}

a:link {
  color:#0101ff;
}

a:hover {
  color:#FD0101;
}

    EOF
    js = <<-EOF
    /* Generated by Balsamiq Exporter
/* Simon Willison's cool hack to build out multiple onload events */
function addLoadEvent(func) 
{
  var oldonload = window.onload;
  if (typeof window.onload != 'function') 
  {
    window.onload = func;
  } 
  else 
  {
    window.onload = function() 
    {
      if (oldonload) 
      {
        oldonload();
      }
      func();
    }
  }
}

    EOF
    filename = "textarea"
    TestingFileSupport::test_elements(filename, data, html, css, js, false)
  end

end