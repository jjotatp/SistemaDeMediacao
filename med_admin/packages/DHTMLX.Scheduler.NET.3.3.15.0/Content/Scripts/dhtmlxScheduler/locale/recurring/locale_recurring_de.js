/*
@license
dhtmlxScheduler.Net v.3.3.15 

This software is covered by DHTMLX Evaluation License. Contact sales@dhtmlx.com to get Commercial or Enterprise license. Usage without proper license is prohibited.

(c) Dinamenta, UAB.
*/
Scheduler.plugin(function(e){e.__recurring_template='<div class="dhx_form_repeat"> <form> <div class="dhx_repeat_left"> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="day" />Täglich</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="week"/>Wöchentlich</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="month" checked />Monatlich</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="year" />Jährlich</label> </div> <div class="dhx_repeat_divider"></div> <div class="dhx_repeat_center"> <div style="display:none;" id="dhx_repeat_day"> <label>Wiederholt sich:<br/></label> <label><input class="dhx_repeat_radio" type="radio" name="day_type" value="d"/>jeden</label><input class="dhx_repeat_text" type="text" name="day_count" value="1" />Tag<br /> <label><input class="dhx_repeat_radio" type="radio" name="day_type" checked value="w"/>an jedem Arbeitstag</label> </div> <div style="display:none;" id="dhx_repeat_week"> Wiederholt sich jede<input class="dhx_repeat_text" type="text" name="week_count" value="1" />Woche am:<br /> <table class="dhx_repeat_days"> <tr> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="1" />Montag</label><br /> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="4" />Donnerstag</label> </td> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="2" />Dienstag</label><br /> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="5" />Freitag</label> </td> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="3" />Mittwoch</label><br /> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="6" />Samstag</label> </td> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="0" />Sonntag</label><br /><br /> </td> </tr> </table> </div> <div id="dhx_repeat_month"> <label>Wiederholt sich:<br/></label> <label><input class="dhx_repeat_radio" type="radio" name="month_type" value="d"/>an jedem</label><input class="dhx_repeat_text" type="text" name="month_day" value="1" />Tag eines jeden<input class="dhx_repeat_text" type="text" name="month_count" value="1" />Monats<br /> <label><input class="dhx_repeat_radio" type="radio" name="month_type" checked value="w"/>am</label><input class="dhx_repeat_text" type="text" name="month_week2" value="1" /><select name="month_day2"><option value="1" selected >Montag<option value="2">Dienstag<option value="3">Mittwoch<option value="4">Donnerstag<option value="5">Freitag<option value="6">Samstag<option value="0">Sonntag</select>jeden<input class="dhx_repeat_text" type="text" name="month_count2" value="1" />Monats<br /> </div> <div style="display:none;" id="dhx_repeat_year"> <label>Wiederholt sich:</label> <label><input class="dhx_repeat_radio" type="radio" name="year_type" value="d"/>an jedem</label><input class="dhx_repeat_text" type="text" name="year_day" value="1" />Tag im<select name="year_month"><option value="0" selected >Januar<option value="1">Februar<option value="2">März<option value="3">April<option value="4">Mai<option value="5">Juni<option value="6">Juli<option value="7">August<option value="8">September<option value="9">Oktober<option value="10">November<option value="11">Dezember</select><br /> <label><input class="dhx_repeat_radio" type="radio" name="year_type" checked value="w"/>am</label><input class="dhx_repeat_text" type="text" name="year_week2" value="1" /><select name="year_day2"><option value="1" selected >Montag<option value="2">Dienstag<option value="3">Mittwoch<option value="4">Donnerstag<option value="5">Freitag<option value="6">Samstag<option value="0">Sonntag</select>im<select name="year_month2"><option value="0" selected >Januar<option value="1">Februar<option value="2">März<option value="3">April<option value="4">Mai<option value="5">Juni<option value="6">Juli<option value="7">August<option value="8">September<option value="9">Oktober<option value="10">November<option value="11">Dezember</select><br /> </div> </div> <div class="dhx_repeat_divider"></div> <div class="dhx_repeat_right"> <label><input class="dhx_repeat_radio" type="radio" name="end" checked/>kein Enddatum</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="end" />nach</label><input class="dhx_repeat_text" type="text" name="occurences_count" value="1" />Ereignissen<br /> <label><input class="dhx_repeat_radio" type="radio" name="end" />Schluß</label><input class="dhx_repeat_date" type="text" name="date_of_end" value="'+e.config.repeat_date_of_end+'" /><br /> </div> </form> </div> <div style="clear:both"> </div>';

});