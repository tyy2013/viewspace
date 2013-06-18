$(function() {
		$('#wysiwyg').wysiwyg(
{controls: {
	  separator00 : { visible : true, separator : true },
	  separator01 : { visible : true, separator : true },
      indent  : { visible : true },
      outdent : { visible : true },
      separator02 : { visible : true, separator : true },
      subscript   : { visible : false },
      superscript : { visible : false },
	  separator03 : { visible : false, separator : false },
	  separator04 : { visible : false, separator : false },
	  separator05 : { visible : true, separator : true },
	  separator06 : { visible : false, separator : false },
	  separator07 : { visible : false, separator : false },
	  

          
      
      h4mozilla : { visible : true && $.browser.mozilla, className : 'h4', command : 'heading', arguments : ['h4'], tags : ['h4'], tooltip : "Header 4" },
      h5mozilla : { visible : true && $.browser.mozilla, className : 'h5', command : 'heading', arguments : ['h5'], tags : ['h5'], tooltip : "Header 5" },
      h6mozilla : { visible : true && $.browser.mozilla, className : 'h6', command : 'heading', arguments : ['h6'], tags : ['h6'], tooltip : "Header 6" },
      
      h4 : { visible : true && !( $.browser.mozilla ), className : 'h4', command : 'formatBlock', arguments : ['<H4>'], tags : ['h4'], tooltip : "Header 4" },
      h5 : { visible : true && !( $.browser.mozilla ), className : 'h5', command : 'formatBlock', arguments : ['<H5>'], tags : ['h5'], tooltip : "Header 5" },
      h6 : { visible : true && !( $.browser.mozilla ), className : 'h6', command : 'formatBlock', arguments : ['<H6>'], tags : ['h6'], tooltip : "Header 6" },
      
    
      cut   : { visible : false },
      copy  : { visible : false },
      paste : { visible : false }
    }
  }
  
  	);
  });