var ExamwidgetStats = React.createClass({
	
	getInitialState() {
		return { 
			blank: null,
			doubt: null,
			answered: null
		}
	},

	componentDidMount() {
		$.getJSON('/api/v1/exams.json', (response) => { 
			this.blankAnswer(response);
			this.doubtAnswer(response);
			this.answered(response);
		});
	},

	blankAnswer(exams){
		var blank = exams.filter((e) => {
			return e.value == null && e.answer_id == null ; 
		});
		this.setState({blank: blank.length});
	},

	doubtAnswer(exams){
		var doubt = exams.filter((e) => {
			return e.doubt == true; 
		});
		this.setState({doubt: doubt.length});
	},

	answered(exams){
		var doubt = exams.filter((e) => {
			return e.value != null || e.answer_id != null; 
		});
		this.setState({answered: doubt.length});
	},

	render(){
		return(
			<div className="widget">
			  <h3 className="page-header">{this.props.title}</h3>
			  <ul className="nomargin">
			    <li>
			      <button className="btn btn-xs btn-info"> -  </button> : current question
			    </li>
			    <li>
			      <button className="btn btn-xs btn-default"> -  </button> : blank answer <strong>( {this.state.blank} )</strong>
			    </li>
			    <li>
			      <button className="btn btn-xs btn-warning"> -  </button> : doubt answer <strong>( {this.state.doubt} )</strong>
			    </li>
			    <li>
			      <button className="btn btn-xs btn-success"> -  </button> : answered question  <strong>( {this.state.answered} )</strong>
			    </li>
			  </ul>
			  <p>Click the last number to submit Quiz!</p>
			</div>
		)
	}
})