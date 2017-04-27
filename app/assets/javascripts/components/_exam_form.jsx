var ExamForm = React.createClass({
	getInitialState() {
		return { 
			question:[],
			answers:[]
		}

	},

	componentDidMount() {
		$.getJSON(`/api/v1/exams/${this.props.exam_id}.json`, (response) => { 
			// console.log(response.id)
			this.setState({question: response});
			this.setState({answers: response.answers})
		});
	},

	handleUpdate(){
		console.log('updatee');
	},

	render(){
		return(
			<div className="exam">
			  <h3 className="page-header"> Question No {this.props.exam_number} </h3>
			  <div className="form-group">
			  	<div dangerouslySetInnerHTML={{__html: this.state.question.content}} />
			  	<ExamAnswer answers={this.state.answers} />
			  </div>
			</div>
		)
	}
})