#!/usr/bin/env ruby
      
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.

require "#{File.dirname(__FILE__)}/../testing_file_support"

describe BalsamiqControlParser do
  it "properly handles piechart" do
    data = <<-EOF
            <mockup version="1.0" skin="sketch">
      <controls>
        <control controlID="13" controlTypeID="com.balsamiq.mockups::PieChart" x="17" y="7" w="-1" h="-1" zOrder="0" locked="false" isInGroup="-1"/>
        <control controlID="14" controlTypeID="com.balsamiq.mockups::PieChart" x="243" y="7" w="340" h="187" zOrder="1" locked="false" isInGroup="-1"/>
        <control controlID="15" controlTypeID="com.balsamiq.mockups::PieChart" x="145" y="158" w="195" h="313" zOrder="2" locked="false" isInGroup="-1"/>
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
          <script type = "text/javascript" src="prototype.js"> </script>
          <script type = "text/javascript" src="basic.js"> </script>
          <script type = "text/javascript" src="piechart.js"> </script>
        <title>Balsamiq</title>
        <script type="text/javascript">
          addLoadEvent(function() {draw_piechart("PieChart13canvas", 195, 187, '["#0101FF",0.65,"#FF0101",0.35]')});

          addLoadEvent(function() {draw_piechart("PieChart14canvas", 340, 187, '["#0101FF",0.65,"#FF0101",0.35]')});

          addLoadEvent(function() {draw_piechart("PieChart15canvas", 195, 313, '["#0101FF",0.65,"#FF0101",0.35]')});

        </script>
      </head>

      <body>
        <div class="PieChart" id="PieChart13"
            style="position: absolute; font-size:10pt; text-align: left; left: 17px; top: 7px; width: 195px; 
                   padding:5px; outline: none; color: #010101; background-color: transparent; z-index: 0">
         <canvas id="PieChart13canvas" width="195" height="187">
         </canvas>
        </div>
        <div class="PieChart" id="PieChart14"
            style="position: absolute; font-size:10pt; text-align: left; left: 243px; top: 7px; width: 340px; 
                   padding:5px; outline: none; color: #010101; background-color: transparent; z-index: 1">
         <canvas id="PieChart14canvas" width="340" height="187">
         </canvas>
        </div>
        <div class="PieChart" id="PieChart15"
            style="position: absolute; font-size:10pt; text-align: left; left: 145px; top: 158px; width: 195px; 
                   padding:5px; outline: none; color: #010101; background-color: transparent; z-index: 2">
         <canvas id="PieChart15canvas" width="195" height="313">
         </canvas>
        </div>
      </body>
    </html>
    EOF
    css = <<-EOF

    EOF
    js = <<-EOF

    function draw_piechart(canvasid, w, h, json)
    {
    	var canvasel = document.getElementById(canvasid);
    	var ctx = canvasel.getContext('2d');

      ctx.strokeStyle = "rgba(0,0,0,1.0)";
      ctx.lineWidth = 4;
      ctx.lineCap = "round";

      var graphdata = json.evalJSON(true);
      var values = graphdata.length;
      // first item is color
      var numvalues = graphdata[0].length - 1;

      ctx.lineWidth = 2;
      var radius = Math.min(w-2,h-2)*0.5;

      var value;
      var total = Math.PI*1.5;
      var next;

      for (value = 0; value < values; value += 2)
      {
        ctx.fillStyle = graphdata[value];
        ctx.beginPath();
        next = graphdata[value+1]*2*Math.PI;
        ctx.moveTo(w*0.5,h*0.5);
        ctx.arc(w*0.5,h*0.5,radius,total,total+next, false);
        ctx.moveTo(w*0.5,h*0.5);
        total += next;
        ctx.closePath();
        ctx.fill();
        ctx.stroke();
      }
    }
    EOF
    filename = "piechart"
    TestingFileSupport::test_elements(filename, data, html, css, js, false)
  end

end
