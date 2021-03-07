import React, { useContext, useState } from 'react'
import { useParams, useHistory, useLocation } from "react-router-dom";

import { updateTodo } from '../../apis';
import AppContext from "../../contexts/AppContext";

const EditTodo = () => {
  const location = useLocation()
  const [content, setContent] = useState(location.state.name)
  const { state } = useContext(AppContext);
  const { id } = useParams();
  const userId = state.id;
  const todoId = location.state.todoId
  const history = useHistory()
  
  const update = (id, todoId, userId, content) => {
    updateTodo(id, todoId, userId, content)
  }

  const handleClick = (e) => {
    e.preventDefault()

    update(id, todoId, userId, content)

    history.goBack();
  }

  return (
    <>
      <h1>Edit</h1>

      <form>
        <input 
          type="text"
          value={content}
          onChange={e => setContent(e.target.value)}
        />
        <button onClick={handleClick}>create</button>
      </form>
    </>
  )
}

export default EditTodo