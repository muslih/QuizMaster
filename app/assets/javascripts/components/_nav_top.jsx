var NavTop = React.createClass({
	render(){
		return(
			<div id="navtop">
	      <div className="container">
	        <div className="col-sm-12">           
	          Implementation of Quippers coding test.
	          <div className="pull-right">
	          	Welcome <strong>{this.props.username} </strong> | <a href={this.props.signout} data-method="delete"> Signout </a>
	          </div>       
	        </div>
	     </div>   
	  	</div>
		)
	}
})