var StatsElement = React.createClass({
	render(){
		return(
			<div className="stats">
				<span className="icon">
					<i className={`fa fa-${this.props.icon}`}></i>
				</span>
				<p>
					<span className="number">{this.props.count}</span>
					<span className="title">{this.props.text}</span>
				</p>
			</div>
		)
	}
})