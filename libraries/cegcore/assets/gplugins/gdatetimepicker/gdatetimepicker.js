var GDatetimepicker = {
	/*set_date: function (picker_id, time){
		var date = new Date(time);
		var format = jQuery('#'+picker_id).data('gdatetimepicker-format') ? jQuery('#'+picker_id).data('gdatetimepicker-format') : this.format;
		jQuery('#'+picker_id).val(date.format_date(format));
		jQuery('#'+picker_id).hide_picker();
	},*/
	display_month: function (picker_id, year, month, day){
		var the_month = new Date();
		if(typeof day == 'undefined'){
			the_month.setUTCFullYear(year, month, 1);
		}else{
			the_month.setUTCFullYear(year, month, day);
		}
		var days_header = GDatetimepicker.build_days_header(picker_id, the_month);
		var days_list = GDatetimepicker.build_days_panel(picker_id, the_month);
		return days_header + days_list;
	},
	/*switch_month: function (picker_id, year, month){
		var month_data = GDatetimepicker.display_month(picker_id, year, month);
		jQuery('#'+picker_id).hide_picker();
		jQuery('#'+picker_id).show_picker(month_data);
	},*/
	/*select_month: function (picker_id, year, month){
		var year_data = GDatetimepicker.display_year(picker_id, year, month);
		jQuery('#'+picker_id).hide_picker();
		jQuery('#'+picker_id).show_picker(year_data);
	},*/
	display_year: function (picker_id, year, month){
		var the_year = new Date();
		if(typeof month == 'undefined'){
			the_year.setUTCFullYear(year, 0);
		}else{
			the_year.setUTCFullYear(year, month);
		}
		var months_header = GDatetimepicker.build_months_header(picker_id, the_year);
		var months_list = GDatetimepicker.build_months_panel(picker_id, the_year);
		return months_header + months_list;
	},
	/*switch_year: function (picker_id, year){
		var year_data = GDatetimepicker.display_year(picker_id, year);
		jQuery('#'+picker_id).hide_picker();
		jQuery('#'+picker_id).show_picker(year_data);
	},*/
	display_decade: function (picker_id, year){
		var the_decade = new Date();
		if(typeof year == 'undefined'){
			//the_decade.setUTCFullYear(year, 1);
		}else{
			the_decade.setUTCFullYear(year);
		}
		var years_header = GDatetimepicker.build_years_header(picker_id, the_decade);
		var years_list = GDatetimepicker.build_years_panel(picker_id, the_decade);
		return years_header + years_list;
	},
	/*switch_decade: function (picker_id, year){
		var decade_data = GDatetimepicker.display_decade(picker_id, year);
		jQuery('#'+picker_id).hide_picker();
		jQuery('#'+picker_id).show_picker(decade_data);
	},*/
	get_first_day: function (year, month){
		var the_day = new Date(year, month, 1);
		var offset = the_day.getTimezoneOffset();
		if(offset >= 0){
			return the_day.getUTCDay() - 1;
		}else{
			return the_day.getUTCDay();
		}
	},
	get_month_length: function (year, month){
		var next_month = new Date(year, month + 1, 1);
		next_month.setUTCHours(next_month.getUTCHours() - 13);
		return next_month.getUTCDate();
	},
	build_years_header: function (picker_id, current_date){
		var years_header = '';
		var current_year = current_date.getUTCFullYear();
		var decade_start = Math.floor(current_year/10) * 10;
		var decade_end = decade_start + 20;
		years_header = years_header  + '<div class="gcore-years-header">';

		years_header = years_header  + '<span class="date-nav-item date-nav-left switch_decade" data-year="'+(decade_start - 11)+'">&lsaquo;</span>';
		years_header = years_header  + '<span class="date-nav-item date-select">'+ decade_start + '-' + (decade_end - 1) +'</span>';

		years_header = years_header  + '<span class="date-nav-item date-nav-right switch_decade" data-year="'+(decade_end - 1)+'">&rsaquo;</span>';
		years_header = years_header + '</div>';
		return years_header;
	},
	build_years_panel: function (picker_id, current_date){
		var years_list = '';
		years_list = years_list  + '<div class="gcore-years-picker">';
		var years_rows = [1,2,3,4];
		var current_year = current_date.getUTCFullYear();
		var decade_start = Math.floor(current_year/10) * 10;
		var decade_end = decade_start + 20;
		jQuery.each(years_rows, function(i, row){
			var row_start = decade_start + (i * 5);
			years_list = years_list  + '<div class="years-row">';
			for(var year = row_start; year <= decade_end; year++){
				var active_class = '';
				if(current_date.getUTCFullYear() == year){
					active_class = ' active_date';
				}
				if((year - decade_start) < 5 * row){
					years_list = years_list  + '<div class="year-item selectable_date switch_year'+ active_class +'" data-year="'+year+'">' + year + '</div>';
				}
			}
			years_list = years_list + '</div>';
		});
		years_list = years_list + '</div>';
		return years_list;
	},
	build_months_header: function (picker_id, current_date){
		var months_header = '';
		months_header = months_header  + '<div class="gcore-months-header">';

		months_header = months_header  + '<span class="date-nav-item date-nav-left switch_year" data-year="'+(current_date.getUTCFullYear() - 1)+'">&lsaquo;</span>';
		months_header = months_header  + '<span class="date-nav-item date-select switch_decade" data-year="'+(current_date.getUTCFullYear())+'">'+ current_date.getUTCFullYear() +'</span>';

		months_header = months_header  + '<span class="date-nav-item date-nav-right switch_year" data-year="'+(current_date.getUTCFullYear() + 1)+'">&rsaquo;</span>';
		months_header = months_header + '</div>';
		return months_header;
	},
	build_months_panel: function (picker_id, current_date){
		var months_list = '';
		months_list = months_list  + '<div class="gcore-months-picker">';
		var months_rows = [1,2,3,4];
		jQuery.each(months_rows, function(i, row){
			months_list = months_list  + '<div class="months-row">';
			jQuery.each(GDatetimepicker.shortMonths, function(k, month){
				var active_class = '';
				if(current_date.getUTCMonth() == k){
					active_class = ' active_date';
				}
				if(k < row * (months_rows.length - 1) && k >= (row - 1) * (months_rows.length - 1)){
					months_list = months_list  + '<div class="month-item switch_month selectable_date'+ active_class +'" data-year="'+current_date.getUTCFullYear()+'" data-month="'+k+'">' + month + '</div>';
				}
			});
			months_list = months_list + '</div>';
		});
		months_list = months_list + '</div>';
		return months_list;
	},
	build_days_header: function (picker_id, current_date){
		var days_header = '';
		days_header = days_header  + '<div class="gcore-days-header">';
		var prev_month = new Date();
		prev_month.setUTCFullYear(current_date.getUTCFullYear(), current_date.getUTCMonth() - 1);
		days_header = days_header  + '<span class="date-nav-item date-nav-left switch_month" data-year="'+prev_month.getUTCFullYear()+'" data-month="'+prev_month.getUTCMonth()+'">&lsaquo;</span>';
		days_header = days_header  + '<span class="date-nav-item date-select select_month" data-year="'+current_date.getUTCFullYear()+'" data-month="'+current_date.getUTCMonth()+'">'+ GDatetimepicker.shortMonths[current_date.getUTCMonth()] + ' ' + current_date.getUTCFullYear() +'</span>';
		var next_month = new Date();
		next_month.setUTCFullYear(current_date.getUTCFullYear(), current_date.getUTCMonth() + 1);
		days_header = days_header  + '<span class="date-nav-item date-nav-right switch_month" data-year="'+next_month.getUTCFullYear()+'" data-month="'+next_month.getUTCMonth()+'">&rsaquo;</span>';
		days_header = days_header + '</div>';
		return days_header;
	},
	build_days_panel: function (picker_id, current_date){
		var days_list = '';
		days_list = days_list  + '<div class="gcore-days-picker">';
		var days_rows = [1,2,3,4,5,6,7];
		var first_day = GDatetimepicker.get_first_day(current_date.getUTCFullYear(), current_date.getUTCMonth());

		var month_length = GDatetimepicker.get_month_length(current_date.getUTCFullYear(), current_date.getUTCMonth());
		var days_counter = 1;
		var next_days_counter = 1;
		var prev_days_counter = GDatetimepicker.get_month_length(current_date.getUTCFullYear(), current_date.getUTCMonth() - 1) - first_day + 1;
		jQuery.each(days_rows, function(i, row){
			days_list = days_list  + '<div class="days-row">';
			jQuery.each(GDatetimepicker.shortDays, function(k, day){
				if(i == 0){
					days_list = days_list  + '<div class="day-title">' + day + '</div>';
				}else{
					var active_class = '';
					if(current_date.getUTCDate() == days_counter){
						active_class = ' active_date';
					}
					if(i == 1){
						if(k >= first_day){
							var this_date = new Date();
							this_date.setUTCFullYear(current_date.getUTCFullYear(), current_date.getUTCMonth(), days_counter);
							days_list = days_list  + '<div class="day-item selectable_date'+ active_class +'" data-time="'+this_date.valueOf()+'">' + days_counter + '</div>';
							days_counter = days_counter + 1;
						}else{
							//add last month days
							//var prev_month = current_date.setUTCDate(10);console.log(prev_month);
							days_list = days_list  + '<div class="day-item disabled_date">' + prev_days_counter + '</div>';
							prev_days_counter = prev_days_counter + 1;
						}
					}else{
						if(days_counter > month_length){
							days_list = days_list  + '<div class="day-item disabled_date">' + next_days_counter + '</div>';
							next_days_counter = next_days_counter + 1;
						}else{
							var this_date = new Date();
							this_date.setUTCFullYear(current_date.getUTCFullYear(), current_date.getUTCMonth(), days_counter);
							days_list = days_list  + '<div class="day-item selectable_date'+ active_class +'" data-time="'+this_date.valueOf()+'">' + days_counter + '</div>';
							days_counter = days_counter + 1;
						}
					}
				}
			});
			days_list = days_list + '</div>';
		});
		days_list = days_list + '</div>';
		return days_list;
	},
	fix_number2: function(num){
		return ((num < 10) ? '0' : '') + num;
	},
	format: 'd-m-Y',
	shortMonths: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    longMonths: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
    shortDays: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'],
    longDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
};

(function($){
	Date.prototype.format_date = function(format_string){
		var chars = {
			'Y': this.getUTCFullYear(),
			'm': GDatetimepicker.fix_number2(this.getUTCMonth() + 1),
			'd': GDatetimepicker.fix_number2(this.getUTCDate()),
		};
		jQuery.each(chars, function(char, val){
			format_string = format_string.replace(char, val);
		});
		return format_string;
	}
	
	Date.prototype.parse_date = function(date, format_string){
		var formats = {
			'Ymd': /^(\d{4})(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/,
			'Y-m-d': /^(\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/,
			'm-d-Y': /^(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])-(\d{4})$/,
			'm/d/Y': /^(0[1-9]|1[0-2])\/(0[1-9]|[12]\d|3[01])\/(\d{4})$/,
			'd-m-Y': /^(0[1-9]|[12]\d|3[01])-(0[1-9]|1[0-2])-(\d{4})$/,
			'd.m.Y': /^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.(\d{4})$/,
			'd/m/Y': /^(0[1-9]|[12]\d|3[01])\/(0[1-9]|1[0-2])\/(\d{4})$/,
		};
		var order = {
			'Ymd': ['Y', 'm', 'd'],
			'Y-m-d': ['Y', 'm', 'd'],
			'm-d-Y': ['m', 'd', 'Y'],
			'm/d/Y': ['m', 'd', 'Y'],
			'd-m-Y': ['d', 'm', 'Y'],
			'd.m.Y': ['d', 'm', 'Y'],
			'd/m/Y': ['d', 'm', 'Y'],
		};
		if(!format_string){
			return [];
		}
		var result = {};
		if(parsed = date.match(formats[format_string])){
			jQuery.each(parsed, function(i, val){
				if(i){
					result[order[format_string][i - 1]] = val;
				}
			});
		}
		return result;
	}
	
	$.fn.show_picker = function(contents){
		var $this = $(this);
		$this.gtooltip({'tipclass':'gtooltip gdatetimepicker-panel', 'closable': 1});
		$this.data('content', contents);
		$this.gtooltip('show');
	}

	$.fn.hide_picker = function(){
		var $this = $(this);
		$this.gtooltip('destroy');
	}

	$.fn.gdatetimepicker = function(option, contents){
		this.each(function(){
			var $this = $(this);
			/*if(!$this.data('gdatetimepicker_params')){
				$this.data('gdatetimepicker_params', $.extend({}, GDatetimepicker));
			}*/
			if(typeof option == 'undefined'){
				//var month_data = GDatetimepicker.display_month($this.attr('id'));
				$this.on('focus', function(event){
					var the_month = new Date();
					var parsed_date = {'Y':the_month.getUTCFullYear(), 'm':the_month.getUTCMonth() + 1, 'd':the_month.getUTCDate()};
					if($this.val()){
						var date = new Date();
						var format = $this.data('gdatetimepicker-format') ? $this.data('gdatetimepicker-format') : GDatetimepicker.format;
						var parsed_date = date.parse_date($this.val(), format);
					}
					var month_data = GDatetimepicker.display_month($this.attr('id'), parsed_date.Y, parsed_date.m - 1, parsed_date.d);
					//$this.show_picker(month_data);
					$this.gdatetimepicker('show', month_data);
					/*$this.gtooltip_return().find('*').on('click', function(ch_e){
						ch_e.stopPropagation();
					});*/
					/*$('html').on('click', function(e){
						if(e.target != event.target){
							$this.hide_picker();
						}
					});*/
				});
				/*$this.on('click', function(event){
					event.stopPropagation();
				});*/
				$this.on('keypress', function(){
					return false;
				});
			}
			
			if(option == 'show'){
				$this.show_picker(contents);
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.day-item.selectable_date').on('click', function(){
					var date = new Date($(this).data('time'));
					var format = $this.data('gdatetimepicker-format') ? $this.data('gdatetimepicker-format') : GDatetimepicker.format;
					$this.val(date.format_date(format));
					$this.hide_picker();
				});
				
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.date-nav-item.switch_month').on('click', function(){
					var month_data = GDatetimepicker.display_month($this, $(this).data('year'), $(this).data('month'));
					$this.hide_picker();
					//$this.show_picker(month_data);
					$this.gdatetimepicker('show', month_data);
				});
				
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.date-nav-item.select_month').on('click', function(){
					var year_data = GDatetimepicker.display_year($this, $(this).data('year'), $(this).data('month'));
					$this.hide_picker();
					//$this.show_picker(year_data);
					$this.gdatetimepicker('show', year_data);
				});
				
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.month-item.switch_month').on('click', function(){
					var month_data = GDatetimepicker.display_month($this, $(this).data('year'), $(this).data('month'));
					$this.hide_picker();
					//$this.show_picker(month_data);
					$this.gdatetimepicker('show', month_data);
				});
				
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.date-nav-item.switch_year').on('click', function(){
					var year_data = GDatetimepicker.display_year($this, $(this).data('year'));
					$this.hide_picker();
					$this.gdatetimepicker('show', year_data);
				});
				
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.date-nav-item.switch_decade').on('click', function(){
					var decade_data = GDatetimepicker.display_decade($this, $(this).data('year'));
					$this.hide_picker();
					//$this.show_picker(decade_data);
					$this.gdatetimepicker('show', decade_data);
				});
				
				$this.gtooltip_return('gtooltip gdatetimepicker-panel').find('.year-item.switch_year').on('click', function(){
					var year_data = GDatetimepicker.display_year($this, $(this).data('year'));
					$this.hide_picker();
					$this.gdatetimepicker('show', year_data);
				});
			}
		});
	}

}(jQuery));